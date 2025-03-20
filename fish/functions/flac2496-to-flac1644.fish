function flac2496-to-flac1644
    if command -sq sox
        mkdir -p 16-44
        for i in *.flac
            sox "$i" -S -r 44100 -b 16 "16-44/$i"
        end
    else
        echo "SoX is not installed. Please install it using 'brew install sox'"
    end
end
