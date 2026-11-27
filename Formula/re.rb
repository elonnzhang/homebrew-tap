class Re < Formula
  desc "Relaunch terminal programs in Rex with OSC 7577"
  homepage "https://github.com/elonnzhang/re-osc7577"
  version "0.0.1"

  depends_on :macos

  on_arm do
    url "https://github.com/elonnzhang/re-osc7577/releases/download/v0.0.1/re-v0.0.1-darwin-arm64.tar.gz"
    sha256 "5ca90aecaa2104e3e69f0d624053bb16870bd4b8f45964cec11a03ecff2a5248"
  end

  on_intel do
    url "https://github.com/elonnzhang/re-osc7577/releases/download/v0.0.1/re-v0.0.1-darwin-amd64.tar.gz"
    sha256 "67673ed58c318c6524d12f1e510ea0d56917b9f7ab4dd63040586be73ddbf187"
  end

  def install
    bin.install "re"
  end

  test do
    assert_equal "re smoke test", shell_output("#{bin}/re /usr/bin/printf 're smoke test'")
    assert_match "re rex install", shell_output("#{bin}/re --help")
  end
end
