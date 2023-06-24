class Ktcodeshift < Formula
  desc "Toolkit for running codemods over multiple Kotlin files inspired by jscodeshift"
  homepage "https://github.com/orangain/ktcodeshift"
  url "https://github.com/orangain/ktcodeshift/releases/download/0.3.1/ktcodeshift-0.3.1.tar.gz"
  sha256 "8fb922b84447f2a1110514b0c0a502949d7f0103631e5950398a30eec9c9455b"
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
