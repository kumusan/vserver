module main

import vweb
import vweb.assets
import time

const (
    port = 8000
)

struct App {
    pub mut:
        vweb vweb.Context
        cnt int
}

fn main() {
    vweb.run<App>(port)
}

pub fn (mut app App) init_once() {
    app.vweb.serve_static('/favicon.ico', 'favicon.ico', 'img/x-icon')
    app.vweb.handle_static('assets')
}

pub fn (mut app App) init() {}

pub fn (mut app App) index() vweb.Result{
    mut am := assets.new_manager()
    am.add_css('assets/index.css')

    css := am.include_css(false)
    title := 'title'
    subtitle := 'sub title'
    message := 'VWeb Example'

    app.cnt++
    text := ['aaa', 'bbb', 'ccc']
    return $vweb.html()
}

fn (mut app App) text() {
    app.vweb.text('Hello, world from vweb!')
}

fn (mut app App) time() {
    app.vweb.text(time.now().format())
}
