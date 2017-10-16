use Rack::Static,
  :urls => ["/images", "/js", "/css"],
  :root => "public"

run lambda { |env|
  path = env['REQUEST_PATH'] != "/" ? env['REQUEST_PATH'] : "/home.html"
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    File.open("public#{path}", File::RDONLY)
  ]
}
