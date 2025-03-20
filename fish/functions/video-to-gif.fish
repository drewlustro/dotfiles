function video-to-gif
    if command -sq ffmpeg
        argparse 'h/help' -- $argv
        or return

        if set -q _flag_help
            echo "Usage: video-to-gif [source.mp4] [fps=15] [maxwidth=preserve]"
            return 0
        end

        set -l srcFile $argv[1]
        set -l fps $argv[2]
        set -l maxwidth $argv[3]

        set -q fps[1]; or set fps 15
        set -q maxwidth[1]; or set maxwidth -1

        if test -f "$srcFile"
            set -l srcFileWithoutExtension (string replace -r '\.[^.]*$' '' $srcFile)
            ffmpeg -y -i $srcFile -filter_complex "fps=$fps,scale=$maxwidth:-1:flags=lanczos,split [o1] [o2];[o1] palettegen [p]; [o2] fifo [o3];[o3] [p] paletteuse" $srcFileWithoutExtension.gif
        else
            echo "Error: Source file not found."
            return 1
        end
    else
        echo "Error: ffmpeg is not installed or not in PATH."
        return 1
    end
end
