class Ktcodeshift < Formula
  desc "Toolkit for running codemods over multiple Kotlin files inspired by jscodeshift"
  homepage "https://github.com/orangain/ktcodeshift"
  url "https://github.com/orangain/ktcodeshift/releases/download/0.3.3/ktcodeshift-0.3.3.tar.gz"
  sha256 "843f1e167ce5bd32a2e0797919fb5b4b5c3f063444b75e101fb636c36fdd642b"
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
