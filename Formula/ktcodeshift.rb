class Ktcodeshift < Formula
  desc "Toolkit for running codemods over multiple Kotlin files inspired by jscodeshift"
  homepage "https://github.com/orangain/ktcodeshift"
  url "https://github.com/orangain/ktcodeshift/releases/download/0.2.5/ktcodeshift-0.2.5.tar.gz"
  sha256 "13c4c9b1ebf666a987c4f1fdd51b95decb0a6609a6abacfadcbfc166d19693d9"
  license "MIT"

  depends_on "openjdk" => [:build, :optional]

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    env = Language::Java.overridable_java_home_env
    (bin/"ktcodeshift").write_env_script libexec/"bin/ktcodeshift", env
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ktcodeshift --version")
  end
end
