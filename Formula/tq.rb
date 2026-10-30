class Tq < Formula
  desc "Run jq filters on JSON and draw the results as tables"
  homepage "https://github.com/elonnzhang/tq"
  url "https://github.com/elonnzhang/tq/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "33e45f98a431e2d3cb1e772581e469a33736e59ccde0c636fa30d2b3f6367efb"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"tqmd"), "./cmd/tqmd"
  end

  test do
    output = pipe_output("#{bin}/tq .", '{"name":"x"}')
    assert_match "name", output
    assert_match version.to_s, shell_output("#{bin}/tq --version")
  end
end
