class Re < Formula
  desc "Relaunch terminal programs in Rex with OSC 7577"
  homepage "https://github.com/elonnzhang/re-osc7577"
  version "0.0.2"

  depends_on :macos

  on_arm do
    url "https://github.com/elonnzhang/re-osc7577/releases/download/v0.0.2/re-v0.0.2-darwin-arm64.tar.gz"
    sha256 "31ba003d5ec3b531af3cd1ba35dea8307f8fe0b51a8b1a6bc5c0bd6128050675"
  end

  on_intel do
    url "https://github.com/elonnzhang/re-osc7577/releases/download/v0.0.2/re-v0.0.2-darwin-amd64.tar.gz"
    sha256 "b9cb11e8b981584c2e206351ccf7dee307a99af2cefb0bfd22fe3a5a47b922a9"
  end

  def install
    bin.install "re"
  end

  test do
    assert_equal "re smoke test", shell_output("#{bin}/re /usr/bin/printf 're smoke test'")
    assert_match "re rex install", shell_output("#{bin}/re --help")
  end
end
