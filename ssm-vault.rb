class SsmVault < Formula
  desc "Secret management with AWS SSM Parameter Store"
  homepage "https://github.com/k24d/ssm-vault"
  url "https://github.com/k24d/ssm-vault/archive/v1.0.1.tar.gz"
  sha256 "1daca22b21771321b8c4cdd9725ef4fb094d8c9a388961141fdb52e24bdb8b42"
  head "https://github.com/k24d/ssm-vault.git", :branch => "master"

  bottle do
    root_url "https://dl.bintray.com/k24d/bottles-ssm-vault"
    cellar :any_skip_relocation
    rebuild 1
    sha256 "00f5de30cd6f3f3524e836b97685ed9a634d6f2b69d117177f47b2d174a02f62" => :high_sierra
  end

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X main.Version=#{pkg_version} -s -w", "-trimpath", "-o", "ssm-vault"
    bin.install "ssm-vault"
  end

  test do
    system "ssm-vault", "--version"
  end
end
