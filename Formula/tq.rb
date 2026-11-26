class Tq < Formula
  desc "Run jq filters on JSON or text tables and draw the results as tables"
  homepage "https://github.com/elonnzhang/tq"
  url "https://github.com/elonnzhang/tq/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "9793f42e452832e5a14905038af47f998ee12cc57f6b54f2b56403dac1f51b13"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"tqmd"), "./cmd/tqmd"
  end

  test do
    output = pipe_output("#{bin}/tq .", '{"name":"x"}')
    assert_match "name", output
    assert_match version.to_s, shell_output("#{bin}/tq --version")
    assert_match version.to_s, shell_output("#{bin}/tqmd --version")

    table = "NAME ENDPOINT SOURCE\nalpha http://127.0.0.1:7420 stored\n"
    assert_equal "alpha\n", pipe_output("#{bin}/tq '.[0].NAME'", table)
    assert_equal "01\n", pipe_output("#{bin}/tq --input table '.[0][0]'", "01 one\n02 two\n")
    assert_equal "7\n", pipe_output("#{bin}/tq -Rs length", "one\ntwo")
    assert_equal "false\n", pipe_output("#{bin}/tq -e .", "false", 1)
  end
end
