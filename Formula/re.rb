class Re < Formula
  desc "Relaunch terminal programs in Rex with OSC 7577"
  homepage "https://github.com/elonnzhang/re-osc7577"
  version "0.0.3"

  depends_on :macos

  on_arm do
    url "https://github.com/elonnzhang/re-osc7577/releases/download/v0.0.3/re-v0.0.3-darwin-arm64.tar.gz"
    sha256 "5334038ce7e28c0988daa98cc799b0a9e0c7183f9e1188353827a3eaf31c9a9b"
  end

  on_intel do
    url "https://github.com/elonnzhang/re-osc7577/releases/download/v0.0.3/re-v0.0.3-darwin-amd64.tar.gz"
    sha256 "760afc8fc4fd7a7549502221ecedbe2c13f0c96b344f3a3744f87e171b8da3bd"
  end

  def install
    bin.install "re"
  end

  test do
    assert_equal "re smoke test", shell_output("#{bin}/re /usr/bin/printf 're smoke test'")
    assert_match "re rex install", shell_output("#{bin}/re --help")
  end
end
