# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Ktcodeshift < Formula
  desc "ktcodeshift is an experimental Kotlin port of jscodeshift."
  homepage ""
  url "https://github.com/orangain/ktcodeshift/releases/download/0.1.0/ktcodeshift-0.1.0.tar.gz"
  sha256 "e3cd77af3842a7746b6b5957abe41b51b6422c603aa17cf905e68151e46fbb19"
  license "MIT"

  # depends_on "cmake" => :build

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
