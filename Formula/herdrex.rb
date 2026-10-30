class Herdrex < Formula
  desc "Serve a Herdr server as a Rex host"
  homepage "https://github.com/elonnzhang/herdrex"
  url "https://github.com/elonnzhang/herdrex/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "7519cfbf523baea7ae2071a602baad1367acbac9e97dc8c532857f423bbb812a"
  head "https://github.com/elonnzhang/herdrex.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "./cmd/herdrex"
  end

  def caveats
    <<~EOS
      herdrex needs a running Herdr server (brew install herdr) and the rex
      command line from Rex.app for --add-host. To serve the default Herdr
      on 127.0.0.1:7388 and add it to your Rex hosts as "herdr":
        herdrex --add-host
      Rex.app does not read those hosts: add the host in Rex.app under
      Settings > Remote Host, with the name and address herdrex prints.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/herdrex --version")
    output = shell_output("#{bin}/herdrex --herdr-socket #{testpath}/none.sock 2>&1", 1)
    assert_match "cannot reach Herdr", output
  end
end
