class Ktcodeshift < Formula
  desc "Toolkit for running codemods over multiple Kotlin files inspired by jscodeshift"
  homepage "https://github.com/orangain/ktcodeshift"
  url "https://github.com/orangain/ktcodeshift/releases/download/0.1.4/ktcodeshift-0.1.4.tar.gz"
  sha256 "82224f45bd420eeaaa30cddb8c0d1288772cf9e372aea5b3726ef22851b89d40"
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
