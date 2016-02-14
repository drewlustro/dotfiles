[animation]
s0_open_matches = ((type=Normal | Unknown) | name=sun-awt-X11-XFramePeer | name=sun-awt-X11-XDialogPeer) & !(role=toolTipTip | role=qtooltip_label) & !(type=Normal & override_redirect=1) & !(name=gnome-screensaver);((type=Menu | PopupMenu | DropdownMenu | Combo | Dialog | ModalDialog | Normal) & !(class=\.exe$));(type=Tooltip | Notification | Utility) & !(name=compiz) & !(title=notify-osd);
s0_close_matches = ((type=Normal | Unknown) | name=sun-awt-X11-XFramePeer | name=sun-awt-X11-XDialogPeer) & !(role=toolTipTip | role=qtooltip_label) & !(type=Normal & override_redirect=1) & !(name=gnome-screensaver) & !(name=gnome-screenshot);((type=Menu | PopupMenu | DropdownMenu | Combo | Dialog | ModalDialog | Normal) & !(class=\.exe$));(type=Tooltip | Notification | Utility) & !(name=compiz) & !(title=notify-osd);
s0_unminimize_effects = animation:Glide 2;

[shift]
s0_ground_color1 = #b3b3b3cc
s0_ground_color2 = #b3b3b300

[snap]
s0_snap_type = 0;1;
s0_edges_categories = 0;1;

[staticswitcher]
s0_next_key = Disabled
s0_prev_key = Disabled
s0_background_color = #333333d9

[expo]
s0_expo_edge = BottomLeft
s0_expo_animation = 2
s0_x_offset = 80
s0_distance = 0.005000
s0_vp_saturation = 40.000000
s0_ground_color1 = #b3b3b3cc
s0_ground_color2 = #b3b3b300

[unityshell]
s0_show_menu_bar = Disabled
s0_show_hud = Disabled
s0_execute_command = <Control>Escape
s0_background_color = #000000ff
s0_override_decoration_theme = true
s0_inactive_shadow_color = #000000a5
s0_show_launcher = <Control>space
s0_launcher_switcher_forward = Disabled
s0_launcher_switcher_prev = Disabled
s0_launcher_opacity = 0.766000
s0_autohide_animation = 2
s0_num_launchers = 1
s0_icon_size = 42
s0_urgent_animation = 1
s0_menus_fadein = 60
s0_menus_fadeout = 80
s0_menus_discovery_fadein = 100
s0_menus_discovery_fadeout = 100
s0_alt_tab_forward = Disabled
s0_alt_tab_prev = Disabled
s0_alt_tab_forward_all = <Control>Tab
s0_alt_tab_prev_all = <Shift><Control>Tab
s0_alt_tab_bias_viewport = false
s0_disable_show_desktop = true

[decor]
s0_active_shadow_radius = 16.000000
s0_active_shadow_opacity = 0.500000
s0_active_shadow_color = #00000080
s0_inactive_shadow_color = #000000ff

[extrawm]
s0_toggle_fullscreen_key = <Control><Alt>f

[put]
s0_put_left_key = <Control><Alt>KP_Left
s0_put_right_key = <Control><Alt>KP_Right
s0_put_top_key = <Control><Alt>KP_Up
s0_put_bottom_key = <Control><Alt>KP_Down
s0_put_topleft_key = <Control><Alt>KP_Home
s0_put_topright_key = <Control><Alt>KP_Prior
s0_put_bottomleft_key = <Control><Alt>KP_End
s0_put_bottomright_key = <Control><Alt>KP_Next

[freewins]
s0_snap_threshold = 50
s0_circle_color = #54befb80
s0_line_color = #1800ffff
s0_cross_line_color = #1800ffff

[composite]
s0_refresh_rate = 50

[switcher]
s0_background_color = #333333d9

[grid]
s0_put_center_key = <Control><Alt><Super>0
s0_put_left_key = <Control><Alt><Super>Left
s0_put_right_key = <Control><Alt><Super>Right
s0_put_top_key = <Control><Alt><Super>Up
s0_put_bottom_key = <Control><Alt><Super>Down
s0_put_maximize_key = <Control><Alt><Super>m
s0_top_edge_action = 0
s0_cycle_sizes = true
s0_outline_color = #00c1ff9f
s0_fill_color = #00bcfb4f

[firepaint]
s0_fire_color = #ff3305ff

[screenshot]
s0_selection_outline_color = #2f2f4f9f
s0_selection_fill_color = #2f2f4f4f

[core]
s0_active_plugins = core;composite;opengl;compiztoolbox;vpswitch;regex;copytex;grid;place;imgpng;session;wall;resize;move;animation;workarounds;snap;commands;expo;mousepoll;fade;unitymtgrabhandles;ezoom;scale;unityshell;switcher;
s0_outputs = 2560x1440+0+0;1200x1920+2560+0;
s0_autoraise = false
s0_autoraise_delay = 500
s0_close_window_key = <Shift><Control>w
s0_minimize_window_key = <Control>m
s0_window_menu_key = Scroll_Lock
s0_show_desktop_key = <Shift><Control>d
s0_toggle_window_shaded_key = <Control>h

[gnomecompat]
s0_main_menu_key = <Super>s
s0_run_command_screenshot_key = <Shift><Control>numbersign
s0_command_window_screenshot = gnome-screenshot -w
s0_run_command_window_screenshot_key = <Shift><Control>percent
s0_run_command_terminal_key = F3

[cubeaddon]
s0_ground_color1 = #b3b3b3cc
s0_ground_color2 = #b3b3b300

[showmouse]
s0_color = #ffdf3fff

[thumbnail]
s0_thumb_color = #0000007f
s0_current_viewport = false
s0_font_background_color = #0000007f

[wall]
s0_thumb_highlight_gradient_shadow_color = #dfdfdfff
s0_arrow_base_color = #e6e6e6d9
s0_arrow_shadow_color = #dcdcdcd9

[resize]
s0_border_color = #00fbad9f
s0_fill_color = #00fbac19

[ezoom]
s0_zoom_box_outline_color = #2f2f4f9f
s0_zoom_box_fill_color = #2f2f2f4f

[resizeinfo]
s0_gradient_1 = #cccce6cc
s0_gradient_2 = #f3f3f3cc
s0_gradient_3 = #d9d9d9cc
s0_outline_color = #e6e6e6ff

