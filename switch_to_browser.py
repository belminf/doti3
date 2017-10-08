#!/usr/bin/env python

import i3ipc

def on_title_change(i3, e):
    if e.container.props.name.endswith('Chromium'):
        e.container.command('focus')

i3 = i3ipc.Connection()
i3.on('window::title', on_title_change)
i3.main()
