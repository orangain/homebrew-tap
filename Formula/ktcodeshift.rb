class Ktcodeshift < Formula
  desc "Toolkit for running codemods over multiple Kotlin files inspired by jscodeshift"
  homepage "https://github.com/orangain/ktcodeshift"
  url "https://github.com/orangain/ktcodeshift/releases/download/0.3.4/ktcodeshift-0.3.4.tar.gz"
  sha256 "00b323ddfe801615ae031a7666c77aafb4b7fd3e4bacbc1b6b7f0486a5796682"
  license "MIT"

  depends_on "openjdk" => [:build, :optional]

  def install
    rm(Dir["bin/*.bat"])
    libexec.install %w[bin lib]
    env = Language::Java.overridable_java_home_env
    (bin/"ktcodeshift").write_env_script libexec/"bin/ktcodeshift", env
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ktcodeshift --version")
  end
end
