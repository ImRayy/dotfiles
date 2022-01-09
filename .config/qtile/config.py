
import os
import re
import socket
import subprocess
from typing import List  # noqa: F401
from libqtile import layout, bar, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen, Rule
from libqtile.command import lazy
from libqtile.widget import Spacer
#import arcobattery

#mod4 or mod = super key
mod = "mod4"
mod1 = "alt"
mod2 = "control"
myTerm = 'alacritty'
home = os.path.expanduser('~')


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

keys = [

# Most of our keybindings are in sxhkd file - except these

# SUPER + FUNCTION KEYS

    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "q", lazy.window.kill()),


# SUPER + SHIFT KEYS

    Key([mod, "shift"], "q", lazy.window.kill()),
    Key([mod, "shift"], "r", lazy.restart()),


# QTILE LAYOUT KEYS
    Key([mod], "n", lazy.layout.normalize()),
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
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod, "control"], "Down",
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

# MOVE WINDOWS UP OR DOWN MONADTALL/MONADWIDE LAYOUT
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "Left", lazy.layout.swap_left()),
    Key([mod, "shift"], "Right", lazy.layout.swap_right()),

# TOGGLE FLOATING LAYOUT
    Key([mod, "shift"], "space", lazy.window.toggle_floating()),

# Log Out
    #key([mod,mod2],"q", lazy.shutdown(), desc="Shutdown Qtile"),
    #key([mod,mod2],"r", lazy.reload_config(), desc="Reload the config"),

    ]

groups = []

# FOR QWERTY KEYBOARDS
group_names = ["1", "2", "3", "4", "5", "6"]

# FOR AZERTY KEYBOARDS
#group_names = ["ampersand", "eacute", "quotedbl", "apostrophe", "parenleft", "section", "egrave", "exclam", "ccedilla", "agrave",]

#group_labels = ["1 ", "2 ", "3 ", "4 ", "5 ", "6 ", "7 ", "8 ", "9 ", "0",]
group_labels = ["", ">_", "", "", "", "",]
#group_labels = ["Web", "Edit/chat", "Image", "Gimp", "Meld", "Video", "Vb", "Files", "Mail", "Music",]

group_layouts = ["monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall", "monadtall",]
#group_layouts = ["monadtall", "matrix", "monadtall", "bsp", "monadtall", "matrix", "monadtall", "bsp", "monadtall", "monadtall",]

for i in range(len(group_names)):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))

for i in groups:
    keys.extend([

#CHANGE WORKSPACES
        Key([mod], i.name, lazy.group[i.name].toscreen()),
        Key([mod], "Tab", lazy.screen.next_group()),
        Key([mod, "shift" ], "Tab", lazy.screen.prev_group()),
        Key(["mod1"], "Tab", lazy.screen.next_group()),
        Key(["mod1", "shift"], "Tab", lazy.screen.prev_group()),

# MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND STAY ON WORKSPACE
        #Key([mod, "shift"], i.name, lazy.window.togroup(i.name)),
# MOVE WINDOW TO SELECTED WORKSPACE 1-10 AND FOLLOW MOVED WINDOW TO WORKSPACE
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name) , lazy.group[i.name].toscreen()),
    ])


def init_layout_theme():
    return {"margin":5,
            "border_width":2,
            "border_focus": "#5e81ac",
            "border_normal": "#4c566a"
            }

layout_theme = init_layout_theme()


layouts = [
    layout.MonadTall(margin=8, border_width=2, border_focus="#5e81ac", border_normal="#4c566a"),
    layout.MonadWide(margin=8, border_width=2, border_focus="#5e81ac", border_normal="#4c566a"),
    layout.Matrix(**layout_theme),
    layout.Bsp(**layout_theme),
    layout.Floating(**layout_theme),
    layout.RatioTile(**layout_theme),
    layout.Max(**layout_theme)
]

# COLORS FOR THE BAR


def init_colors():
    return [
        ["#2F343F", "#2F343F"],  # panel background    
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
        ["#00FFFF", "#00FFFF"],  # cyan 14
        ["#78cd78","#78cd78"],   # green 15
        ["#ffc85a","#ffc85a"],   # yellow 16
        ["#2F343F","#2F343F"],   # Color 1
        ["#282c34", "#282c34"],  # 18 panel background
        ["#f3f4f5", "#f3f4f5"],  # white
    ]


colors = init_colors()


def base(fg="text", bg="dark"):
    return {"foreground": colors[4], "background": colors[5]}


# WIDGETS FOR THE BAR


def init_widgets_defaults():
    return dict(font="FiraCode Nerd Font Medium", fontsize=12, padding=2, background=colors[18])


widget_defaults = init_widgets_defaults()


def init_widgets_list():
    prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())
    widgets_list = [
        widget.Sep(linewidth=0, padding=2, foreground=colors[2], background=colors[18]),
    #    widget.TextBox(
    #        text=" ",
            # font="Noto Color Emoji",
    #        font="FiraMono Nerd Font",
    #        fontsize=15,
    #        foreground="#dc1a1a",
    #        background=colors[18],
    #        margin_x=5,
    #        padding_y=4 ,
    #        mouse_callbacks={"Button1": lambda: qtile.cmd_spawn("xfce4-appfinder")},
    #    ),
        #widget.Sep(linewidth=0, padding=11, foreground=colors[2], background="#ffffff"),
        #widget.Sep(linewidth=0, padding=5, foreground=colors[4], background="#05AFF2"),
        #widget.Sep(linewidth=0, padding=5, foreground=colors[2], background=colors[18]),
        #widget.Sep(linewidth=0, padding=5, foreground=colors[2], background=colors[18]),
    #    widget.Sep(linewidth=0, padding=5, foreground=colors[2], background=colors[18]),
        widget.GroupBox(
            font="FiraMono Nerd Font",
            fontsize=16,
            margin_y=2,
            margin_x=10,
            padding_y=4,
            padding_x=3,
            borderwidth=0,
            active=colors[2],
            inactive=colors[9],
            rounded=True,
            highlight_color=colors[0],
            highlight_method="text",
            this_current_screen_border=colors[15],
            block_highlight_text_color=colors[2],
            foreground=colors[2],
            background=colors[0],
            other_current_screen_border=colors[2],
            other_screen_border=colors[0],
            disable_drag=True,
        ),
        widget.Sep(linewidth=0, padding=5, foreground=colors[2], background=colors[0]),
        widget.TaskList(
            font="FiraMono Nerd Font Medium",
            highlight_method="block",  # or border
            icon_size=0,
            max_title_width=250,
            rounded=True,
        #    padding_x=10,
        #    padding_y=2,
        #    margin_y=0,
        #    fontsize=14,
            border=colors[0],
            foreground=colors[19],
        #    margin=0,
            txt_floating="🗗",
            txt_minimized=">_ ",
            borderwidth=0,
            background=colors[18],
        #    unfocused_border="border",
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
            scale=0.6,
        ),
        widget.CurrentLayout(
            font="FiraMono Nerd Font Medium",
            fontsize=12,
            foreground=colors[2],
            background=colors[0],
        ),
        widget.Sep(linewidth=0, padding=5, foreground=colors[2], background=colors[0]),
        widget.Systray(background=colors[0], padding=9),
        #widget.Net(
        #    font="Noto Sans",
        #    fontsize=12,
            # Here enter your network name
        #    interface=["enp1s0f0u10"],
        #    format="{down} ↓↑ {up}",
        #    foreground=colors[5],
        #    background=colors[3],
        #    padding=0,
        #),
        #widget.Backlight(update_interval=1),
       # widget.Sep(linewidth=0, padding=10, foreground=colors[2], background=colors[0]),
        widget.CPU(
            font="FiraMono Nerd Font Medium",
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
            font="FiraMono Nerd Font Medium",
            update_interval=1,
            fontsize=12,
        #    tag_sensor="Core 8",
        #    background=colors[0],
            background=colors[18],
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
            mouse_callbacks={"Button1": lambda: qtile.cmd_spawn( "alacritty -e gotop")},
        ),
        widget.Memory(
            format="{MemUsed: .0f}/{MemTotal:.0f} GB ",
            font="FiraMono Nerd Font Medium",
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
        widget.Sep(linewidth=0, padding=8, foreground=colors[2], background=colors[18]),
        widget.Net(
            prefix_inactive="Disconnected",
            format='{interface}: {down} ↓',
            font="FiraMono Nerd Font",
        #    prefix_paused="Paused",
            fontsize=12,
            color_inactive=colors[2],
        #    background=colors[8],
            background=colors[18],
            foreground=colors[14],
            opacity = 0.2
        ),
        widget.Sep(linewidth=0, padding=8, foreground=colors[2], background=colors[18]),
       # widget.Clipboard(padding=20),
       #  widget.Sep(linewidth=0, padding=8, foreground=colors[2], background=colors[0]),
        widget.CheckUpdates(
            distro="Arch_checkupdates",
            font="FiraMono Nerd Font Medium",
            colour_no_updates="#98ff98",
            display_format=" {updates}",
            no_update_string=" ",
            fontsize=13,
            mouse_callbacks={
                "Button1": lambda: qtile.cmd_spawn(myTerm + " --hold -e paru")
            },
            padding=5,
       #     background=colors[14],
            background=colors[18],
        ),
        # widget.Backlight(),
        widget.Clock(
            foreground=colors[16],
            font="FiraMono Nerd Font",
            background=colors[18],
            fontsize=14,
            format=" %d %b/%y %H:%M ",
            mouse_callbacks={"Button1": toggle_clock},

        ),
         widget.QuickExit(
             foreground="#e65256",
             background=colors[18],
             default_text=" ",
             fontsize=17,
         ),
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


#widgets_screen1 = init_widgets_screen1()
#widgets_screen2 = init_widgets_screen2()


def init_screens():
    return [
        Screen(
            top=bar.Bar(
                widgets=init_widgets_screen1(),
                size=28,
                opacity=0.8,
            #    background=colors[18],
                margin=[9, 9, 0, 9],
            )
        ),
        Screen(
            top=bar.Bar(
                widgets=init_widgets_screen2(),
                size=28,
                opacity=0.8,
           #     background=colors[18],
            )
        ),
    ]


screens = init_screens()

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/scripts/autostart.sh'])


# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
