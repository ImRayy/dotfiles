# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE


import os
import re
import socket
import subprocess
from typing import List  # noqa: F401
from libqtile import layout, bar, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen, Rule
from libqtile.command import lazy

from libqtile.widget import Spacer

# mod4 or mod = super key
mod = "mod4"
mod1 = "alt"
mod2 = "control"
home = os.path.expanduser("~")


@lazy.function
def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


@lazy.function
def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


myTerm = "kitty"  # My terminal of choice

keys = [
    
    # To turn on or off the Laptop Display
    Key([mod, "shift"], "o", lazy.spawn("xrandr --output eDP1 --off")),
    Key([mod], "o", lazy.spawn("xrandr --output eDP1 --auto")),

    # SUPER + FUNCTION KEYS
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "t", lazy.spawn("xterm")),
    Key([mod], "v", lazy.spawn("pavucontrol")),
    Key(
        [mod],
        "d",
        lazy.spawn("sh /home/beasty/.config/rofi/launchers/misc/launcher.sh"),
    ),
    Key([mod], "m", lazy.spawn("sh /home/beasty/.config/rofi/powermenu/powermenu.sh")),
    Key([mod], "Escape", lazy.spawn("xkill")),
    Key([mod], "Return", lazy.spawn(myTerm)),
    Key([mod], "KP_Enter", lazy.spawn(myTerm)),
    Key([mod], "b", lazy.spawn("brave")),
    Key([mod], "a", lazy.spawn("firefox")),
    Key([mod], "s", lazy.spawn("nautilus")),
    Key([mod], "e", lazy.spawn("emacsclient -c -a 'emacs'")),
    Key([mod], "p", lazy.spawn("flameshot gui")),
    Key([mod], "c", lazy.spawn("code")),
    Key([mod], "n", lazy.spawn("notion-app-enhanced")),
    Key([mod], "x", lazy.spawn("arcolinux-logout")),
    # SUPER + SHIFT KEYS
    Key([mod, "shift"], "d", lazy.spawn("nwggrid -p -o 0.4")),
    Key([mod, "shift"], "Return", lazy.spawn("nautilus")),
    Key([mod], "r", lazy.spawn( "dmenu_run -i -nb '#191919' -nf '#fea63c' -sb '#fea63c' -sf '#191919' -fn 'NotoMonoRegular:bold:pixelsize=14'"),),
    #    Key([mod, "shift"], "d", lazy.spawn(home + '/.config/qtile/scripts/dmenu.sh')),
    Key([mod, "shift"], "q", lazy.window.kill()),
    Key([mod, "shift"], "r", lazy.restart()),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "shift"], "x", lazy.shutdown()),
    # CONTROL + ALT KEYS
    Key(
        ["mod1", "control"],
        "o",
        lazy.spawn(home + "/.config/qtile/scripts/picom-toggle.sh"),
    ),
    Key(["mod1", "control"], "t", lazy.spawn("xterm")),
    Key(["mod1", "control"], "u", lazy.spawn("pavucontrol")),
    # ALT + ... KEYS
    Key(["mod1"], "p", lazy.spawn("pamac-manager")),
    Key(["mod1"], "f", lazy.spawn("firedragon")),
    Key(["mod1"], "m", lazy.spawn("pcmanfm")),
    Key(["mod1"], "w", lazy.spawn("garuda-welcome")),
    # CONTROL + SHIFT KEYS
    Key([mod2, "shift"], "Escape", lazy.spawn("lxtask")),
    # SCREENSHOTS
    Key([], "Print", lazy.spawn("flameshot full -p " + home + "/Pictures")),
    Key([mod2], "Print", lazy.spawn("flameshot full -p " + home + "/Pictures")),
    #    Key([mod2, "shift"], "Print", lazy.spawn('gnome-screenshot -i')),
    # MULTIMEDIA KEYS
    # INCREASE/DECREASE BRIGHTNESS
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 5")),
    # INCREASE/DECREASE/MUTE VOLUME
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 5%+")),
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),
    #    Key([], "XF86AudioPlay", lazy.spawn("mpc toggle")),
    #    Key([], "XF86AudioNext", lazy.spawn("mpc next")),
    #    Key([], "XF86AudioPrev", lazy.spawn("mpc prev")),
    #    Key([], "XF86AudioStop", lazy.spawn("mpc stop")),
    # QTILE LAYOUT KEYS
    # Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "space", lazy.next_layout()),
    # CHANGE FOCUS
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    # RESIZE UP, DOWN, LEFT, RIGHT
    Key(
        [mod, "control"],
        "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
    ),
    Key(
        [mod, "control"],
        "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
    ),
    Key(
        [mod, "control"],
        "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
    ),
    Key(
        [mod, "control"],
        "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
    ),
    Key(
        [mod, "control"],
        "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
    ),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
    ),
    Key(
        [mod, "control"],
        "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
    ),
    # FLIP LAYOUT FOR MONADTALL/MONADWIDE
    Key([mod, "shift"], "f", lazy.layout.flip()),
    # FLIP LAYOUT FOR BSP
    Key([mod, "mod1"], "k", lazy.layout.flip_up()),
    Key([mod, "mod1"], "j", lazy.layout.flip_down()),
    Key([mod, "mod1"], "l", lazy.layout.flip_right()),
    Key([mod, "mod1"], "h", lazy.layout.flip_left()),
    # MOVE WINDOWS UP OR DOWN BSP LAYOUT
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    ### Treetab controls
    Key(
        [mod, "control"],
        "k",
        lazy.layout.section_up(),
        desc="Move up a section in treetab",
    ),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.section_down(),
        desc="Move down a section in treetab",
    ),
    # MOVE WINDOWS UP OR DOWN MONADTALL/MONADWIDE LAYOUT
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),
    # TOGGLE FLOATING LAYOUT
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),
]

groups = []

# FOR QWERTY KEYBOARDS
group_names = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "0",
]

# FOR AZERTY KEYBOARDS
# group_names = ["ampersand", "eacute", "quotedbl", "apostrophe", "parenleft", "section", "egrave", "exclam", "ccedilla", "agrave",]

group_labels = [
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    "",
]

group_matches = [
    [Match(wm_class="firefox"), Match(wm_class="brave")],
    [Match(wm_class=myTerm)],
    [Match(wm_class="code"), Match(wm_class="nvim"), Match(wm_class="neovide")],
    [Match(wm_class="discord"), Match(wm_class="zoom")],
    [Match(wm_class="blender")],
    [Match(wm_class="nautilus")],
    [Match(wm_class="nnn")],
    [Match(wm_class="")],
    [Match(wm_class="")],
    [Match(wm_class="atom")],
]

# group_labels = ["", "", "", "", "", "", "", "", "", "",]
# group_labels = ["", "", "", "", "",]

# group_labels = ["Web", "Edit/chat", "Image", "Gimp", "Meld", "Video", "Vb", "Files", "Mail", "Music",]

group_layouts = [
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "monadtall",
    "treetab",
    "floating",
]
# group_layouts = ["monadtall", "matrix", "monadtall", "bsp", "monadtall", "matrix", "monadtall", "bsp", "monadtall", "monadtall",]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
            matches=group_matches[i],
        )
    )

for g in groups:
    keys.extend(
        [
            # CHANGE WORKSPACES
            Key([mod], g.name, lazy.group[g.name].toscreen()),
            Key([mod], "Tab", lazy.screen.next_group()),
            Key([mod, "shift"], "Tab", lazy.screen.prev_group()),
            Key(["mod1"], "Tab", lazy.screen.next_group()),
            Key(["mod1", "shift"], "Tab", lazy.screen.prev_group()),
            # MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND STAY ON WORKSPACE
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
            # MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND FOLLOW MOVED WINDOW TO WORKSPACE
            Key(
                [mod, "shift"],
                g.name,
                lazy.window.togroup(g.name),
                lazy.group[g.name].toscreen(),
            ),
        ]
    )


def init_layout_theme():
    return {
        "margin": 8,
        "border_width": 1,
        "border_focus": "#ff00ff",
        "border_normal": "#f4c2c2",
    }


layout_theme = init_layout_theme()


layouts = [
    layout.MonadTall(
        margin=8, border_width=1, border_focus="#000000", border_normal="#3d3f4b"
    ),
    layout.MonadWide(
        margin=8, border_width=2, border_focus="#ff00ff", border_normal="#f4c2c2"
    ),
    layout.Matrix(**layout_theme),
    layout.Bsp(**layout_theme),
    layout.Floating(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Max(**layout_theme),
    layout.Columns(**layout_theme),
    layout.Stack(**layout_theme),
    layout.Tile(**layout_theme),
    layout.TreeTab(
        sections=["FIRST", "SECOND"],
        bg_color="#141414",
        active_bg="#0000ff",
        inactive_bg="#1e90ff",
        padding_y=5,
        section_top=10,
        panel_width=280,
    ),
    layout.VerticalTile(**layout_theme),
    layout.Zoomy(**layout_theme),
]

# COLORS FOR THE BAR


def init_colors():
    return [
        ["#282c34", "#282c34"],  # 0 panel background
        ["#3d3f4b", "#434758"],  # 1 background for current screen tab
        ["#ffffff", "#ffffff"],  # 2 font color for group names
        ["#ff5555", "#ff5555"],  # 3 border line color for current tab
        ["#74438f", "#74438f"],  # 4 border line color for 'other tabs'
        ["#4f76c7", "#4f76c7"],  # 5 color for the 'even widgets '
        ["#e1acff", "#e1acff"],  # 6window name
        ["#88c0d0", "#88c0d0"],  # 7 Blue
        ["#6790eb", "#6790eb"],  # 8 color 8
        ["#909090", "#909090"],  # color 9
        ["#D93D4A", "#D93D4A"],  # color 10
        ["#05AFF2", "#05AFF2"],  # color 11
        ["#000000", "#000000"],  # color 12
        ["#f2ce00", "#f2ce00"],  # magenta 13
        ["#7a5ccc", "#7a5ccc"],  # cyan 14
        # ["#ecf0c1", "#ecf0c1"],  # ACTIVE WORKSPACES 0
        # ["#e33400", "#e33400"],  # red 3
        # ["#5ccc96", "#5ccc96"],  # green 4
        # ["#b3a1e6", "#b3a1e6"],  # yellow 5
        # ["#00a3cc", "#00a3cc"],  # blue 6
        # ["#7a5ccc", "#7a5ccc"],  # cyan 8
        # ["#686f9a", "#686f9a"],  # white 9
        # ["#f0f1ce", "#f0f1ce"],  # grey 10
        # ["#d08770", "#d08770"],  # orange 11
        # ["#1b1c36", "#1b1c36"],  # super cyan12
        # ["#0f111b", "#0f111b"],  # super blue 13
        # ["#0e131a", "#0e131a"],  # super dark background 14
    ]


colors = init_colors()


def base(fg="text", bg="dark"):
    return {"foreground": colors[4], "background": colors[5]}


# WIDGETS FOR THE BAR


def init_widgets_defaults():
    return dict(font="Noto Sans", fontsize=9, padding=2, background=colors[1])


widget_defaults = init_widgets_defaults()


def init_widgets_list():
    prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
    widgets_list = [
        widget.Sep(linewidth=0, padding=9, foreground=colors[2], background=colors[2]),
        widget.TextBox(
            # text="ऋ ",
            text="",
            # font="Noto Color Emoji",
            font="FiraMono Nerd Font",
            fontsize=23,
            foreground=colors[0],
            background=colors[2],
            margin_x=5,
            padding_y=4,
            mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("jgmenu_run")},
        ),
        widget.Sep(linewidth=0, padding=11, foreground=colors[2], background="#ffffff"),
        widget.Sep(linewidth=0, padding=5, foreground=colors[4], background="#05AFF2"),
        widget.Sep(linewidth=0, padding=5, foreground=colors[2], background="#000000"),
        widget.Sep(linewidth=0, padding=5, foreground=colors[2], background="#ffffff"),
        widget.Sep(linewidth=0, padding=5, foreground=colors[2], background="#D93D4A"),
        widget.GroupBox(
            font="FiraMono Nerd Font",
            fontsize=13,
            margin_y=3,
            margin_x=6,
            padding_y=4,
            padding_x=3,
            borderwidth=0,
            active=colors[2],
            inactive=colors[9],
            rounded=True,
            highlight_color=colors[0],
            highlight_method="text",
            this_current_screen_border=colors[14],
            block_highlight_text_color=colors[2],
            foreground=colors[2],
            background=colors[0],
            other_current_screen_border=colors[2],
            other_screen_border=colors[0],
            disable_drag=True,
        ),
        widget.Sep(linewidth=0, padding=5, foreground=colors[2], background=colors[0]),
        widget.TaskList(
            font="FiraMono Nerd Font",
            highlight_method="block",  # or border
            icon_size=13,
            max_title_width=250,
            # rounded=True,
            padding_x=10,
            padding_y=2,
            margin_y=0,
            fontsize=14,
            border=colors[12],
            foreground=colors[2],
            margin=0,
            txt_floating="🗗",
            txt_minimized=">_ ",
            borderwidth=0,
            background=colors[0],
            # unfocused_border="border",
        ),
        widget.Moc(
            font="CaskaydiaCove Nerd Font",
            update_interval=1,
            fontsize=20,
            foreground=colors[2],
            background=colors[0],
        ),
        widget.Mpris2(  # Audacious
            font="CaskaydiaCove Nerd Font",
            update_interval=1,
            fontsize=13,
            foreground=colors[2],
            background=colors[0],
            stop_pause_text="Record Broken",
        ),
        widget.CurrentLayoutIcon(
            custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
            foreground=colors[2],
            background=colors[0],
            padding=0,
            scale=0.7,
        ),
        widget.CurrentLayout(
            font="FiraMono Nerd Font",
            fontsize=12,
            foreground=colors[2],
            background=colors[0],
        ),
        widget.Sep(linewidth=0, padding=5, foreground=colors[2], background=colors[0]),
        widget.Systray(background=colors[0], padding=9),
        widget.Net(
            font="Noto Sans",
            fontsize=12,
            # Here enter your network name
            interface=["wlp6s0"],
            format="{down} ↓↑ {up}",
            foreground=colors[5],
            background=colors[3],
            padding=0,
        ),
        # widget.Backlight(update_interval=1),
        widget.Sep(linewidth=0, padding=10, foreground=colors[2], background=colors[0]),
        widget.CPU(
            font="FiraMono Nerd Font",
            format=" CPU {load_percent}%",
            # format = '{MemUsed}M/{MemTotal}M',
            update_interval=1,
            fontsize=12,
            foreground=colors[2],
            background=colors[0],
            mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(myTerm + " -e htop")},
        ),
        widget.Sep(linewidth=0, padding=10, foreground=colors[2], background=colors[0]),
        widget.TextBox(
            text="",
            font="Noto Color Emoji",
            fontsize=15,
            foreground=colors[13],
            background=colors[0],
            margin_x=5,
            padding_y=4,
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(myTerm + " --hold -e sensors")
            },
        ),
        widget.Sep(linewidth=0, padding=5, foreground=colors[2], background=colors[0]),
        widget.ThermalSensor(
            font="FiraMono Nerd Font",
            update_interval=1,
            fontsize=12,
            tag_sensor="Core 0",
            background=colors[0],
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(myTerm + " --hold -e sensors")
            },
        ),
        # widget.ThermalSensor(
        #     font="CaskaydiaCove Nerd Font",
        #     update_interval=1,
        #     fontsize=12,
        #     tag_sensor="Core 1",
        #     background=colors[0],
        #     mouse_callbacks={
        #         "Button1": lambda: qtile.cmd_spawn(myTerm + " --hold -e senors")
        #     },
        # ),
        widget.Sep(linewidth=0, padding=10, foreground=colors[2], background=colors[0]),
        widget.TextBox(
            text="ﰧ",
            font="Noto Color Emoji",
            fontsize=15,
            foreground=colors[7],
            background=colors[0],
            margin_x=5,
            padding_y=4,
            mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(myTerm + " -e htop")},
        ),
        widget.Memory(
            format="{MemUsed: .0f}/{MemTotal:.0f} GB ",
            font="FiraMono Nerd Font",
            update_interval=1,
            fontsize=12,
            measure_mem="G",
            markup="False",
            foreground=colors[2],
            background=colors[0],
            mouse_callbacks={"Button1": lambda: qtile.cmd_spawn(myTerm + " -e htop")},
        ),
        # widget.TextBox(
        #     text="  ",
        #     font="FontAwesome",
        #     fontsize=15,
        #     foreground=colors[7],
        #     background=colors[0],
        #     margin_x=5,
        #     padding_y=4,
        #     mouse_callbacks={
        #         "Button4": lambda: qtile.cmd_spawn(
        #             "pactl set-sink-volume @DEFAULT_SINK@ +5%"
        #         ),
        #         "Button5": lambda: qtile.cmd_spawn(
        #             "pactl set-sink-volume @DEFAULT_SINK@ -5%"
        #         ),
        #     },
        # ),
        # widget.PulseVolume(
        #     font="CaskaydiaCove Nerd Font",
        #     fontsize=13,
        #     foreground=colors[7],
        #     background=colors[0],
        #     padding=5,
        #     mouse_callbacks={
        #         "Button4": lambda: qtile.cmd_spawn(
        #             "pactl set-sink-volume @DEFAULT_SINK@ +5%"
        #         ),
        #         "Button5": lambda: qtile.cmd_spawn(
        #             "pactl set-sink-volume @DEFAULT_SINK@ -5%"
        #         ),
        #     },
        # ),
        widget.Sep(linewidth=0, padding=8, foreground=colors[2], background=colors[8]),
        widget.Pomodoro(
            prefix_inactive="Pomodoro",
            font="FiraMono Nerd Font",
            prefix_paused="Paused",
            fontsize=13,
            color_inactive=colors[2],
            background=colors[8],
            foreground=colors[2],
            opacity = 0.2
        ),
        widget.Sep(linewidth=0, padding=8, foreground=colors[2], background=colors[8]),
        widget.Battery(
            charge_char="",
            font="FiraMono Nerd Font",
            discharge_char="",
            empty_char="",
            full_char="",
            show_short_text=False,
            low_foreground=colors[4],
            foreground=colors[2],
            background=colors[0],
            padding=8,
            fontsize=12,
            format=" {percent:2.0%}",
            # opacity = 0.05
            # format='{char} {percent: 2.0%}'
        ),
        # widget.Sep(linewidth=0, padding=8, foreground=colors[2], background=colors[0]),
        widget.CheckUpdates(
            distro="Arch_checkupdates",
            font="FiraMono Nerd Font",
            display_format=" {updates}",
            no_update_string=" ",
            fontsize=13,
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(myTerm + " --hold -e paru")
            },
            padding=5,
            background=colors[14],
        ),
        # widget.Backlight(),
        widget.Clock(
            foreground=colors[12],
            font="FiraMono Nerd Font",
            background=colors[2],
            fontsize=14,
            format=" %d %b/%y %H:%M ",
            mouse_callbacks={"Button1": toggle_clock},

        ),
        # widget.QuickExit(
        #     foreground=colors[12],
        #     background=colors[2],
        #     default_text=" ",
        #     fontsize=17,
        # ),
    ]
    return widgets_list


def toggle_clock():
    time_format = "%I:%M %p"
    date_format = "%d %b %a"

    # Get the clock widget
    clock = qtile.widgets_map["clock"]

    # Look for an attribute called "_toggled" which we'll use to track the state
    if not getattr(clock, "_toggled", False):
        # if it's not "toggled" then change to the date format and set the flag
        clock.format = date_format
        clock._toggled = True
    else:
        # otherwise, change back to the time format
        clock.format = time_format
        clock._toggled = False
    clock.tick()
    # This may change the widget length so we should redraw the bar
    clock.bar.draw()


widgets_list = init_widgets_list()


def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1


def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2


widgets_screen1 = init_widgets_screen1()
widgets_screen2 = init_widgets_screen2()


def init_screens():
    return [
        Screen(
            top=bar.Bar(
                widgets=init_widgets_screen1(),
                size=24,
                opacity=0.75,
                background="000000",
                margin=[9, 9, 0, 9],
            )
        ),
        Screen(
            top=bar.Bar(
                widgets=init_widgets_screen2(),
                size=24,
                opacity=1.85,
                background="000000",
            )
        ),
    ]


screens = init_screens()


# MOUSE CONFIGURATION
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
]

dgroups_key_binder = None
# dgroups_app_rules = []

# ASSIGN APPLICATIONS TO A SPECIFIC GROUPNAME BEGIN
#########################################################
################ assgin apps to groups ##################
#########################################################
# @hook.subscribe.client_new
# def assign_app_group(client):
#     d = {}
#     #########################################################
#     ################ assgin apps to groups ##################
#     #########################################################
#     d["1"] = ["Navigator", "Firefox", "Vivaldi-stable", "Vivaldi-snapshot", "Chromium", "Google-chrome", "Brave", "Brave-browser",
#               "navigator", "firefox", "vivaldi-stable", "vivaldi-snapshot", "chromium", "google-chrome", "brave", "brave-browser", ]
#     d["2"] = [ "Atom", "Subl3", "Geany", "Brackets", "Code-oss", "Code", "TelegramDesktop", "Discord",
#                "atom", "subl3", "geany", "brackets", "code-oss", "code", "telegramDesktop", "discord", ]
#     d["3"] = ["Inkscape", "Nomacs", "Ristretto", "Nitrogen", "Feh",
#               "inkscape", "nomacs", "ristretto", "nitrogen", "feh", ]
#     d["4"] = ["Gimp", "gimp" ]
#     d["5"] = ["Meld", "meld", "org.gnome.meld" "org.gnome.Meld" ]
#     d["6"] = ["Vlc","vlc", "Mpv", "mpv" ]
#     d["7"] = ["VirtualBox Manager", "VirtualBox Machine", "Vmplayer",
#               "virtualbox manager", "virtualbox machine", "vmplayer", ]
#     d["8"] = ["pcmanfm", "Nemo", "Caja", "Nautilus", "org.gnome.Nautilus", "Pcmanfm", "Pcmanfm-qt",
#               "pcmanfm", "nemo", "caja", "nautilus", "org.gnome.nautilus", "pcmanfm", "pcmanfm-qt", ]
#     d["9"] = ["Evolution", "Geary", "Mail", "Thunderbird",
#               "evolution", "geary", "mail", "thunderbird" ]
#     d["0"] = ["Spotify", "Pragha", "Clementine", "Deadbeef", "Audacious",
#               "spotify", "pragha", "clementine", "deadbeef", "audacious" ]
#     ##########################################################
#     wm_class = client.window.get_wm_class()[0]
#
#     for i in range(len(d)):
#         if wm_class in list(d.values())[i]:
#             group = list(d.keys())[i]
#             client.togroup(group)
#             client.group.cmd_toscreen()

# END
# ASSIGN APPLICATIONS TO A SPECIFIC GROUPNAME


main = None


@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser("~")
    subprocess.call([home + "/.config/qtile/scripts/autostart.sh"])


@hook.subscribe.startup
def start_always():
    # Set the cursor to something sane in X
    subprocess.Popen(["xsetroot", "-cursor_name", "left_ptr"])


@hook.subscribe.client_new
def set_floating(window):
    if (
        window.window.get_wm_transient_for()
        or window.window.get_wm_type() in floating_types
    ):
        window.floating = True


floating_types = ["notification", "toolbar", "splash", "dialog"]


follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirm"),
        Match(wm_class="dialog"),
        Match(wm_class="download"),
        Match(wm_class="error"),
        Match(wm_class="file_progress"),
        Match(wm_class="notification"),
        Match(wm_class="splash"),
        Match(wm_class="toolbar"),
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="Arandr"),
        Match(wm_class="feh"),
        Match(wm_class="Galculator"),
        Match(title="branchdialog"),
        Match(title="Open File"),
        Match(title="pinentry"),
        Match(wm_class="ssh-askpass"),
        Match(wm_class="lxpolkit"),
        Match(wm_class="Lxpolkit"),
        Match(wm_class="yad"),
        Match(wm_class="Yad"),
        Match(wm_class="Cairo-dock"),
        Match(wm_class="cairo-dock"),
    ],
    fullscreen_border_width=0,
    border_width=0,
)
auto_fullscreen = True

focus_on_window_activation = "focus"  # or smart

wmname = "LG3D"
