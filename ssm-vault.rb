class SsmVault < Formula
  desc "Secret management with Amazon SSM Parameter Store"
  homepage "https://github.com/k24d/ssm-vault"
  url "https://github.com/k24d/ssm-vault/archive/v1.0.0.tar.gz"
  sha256 "9d21606244254b146cc104456e1acad7cef759472938b3c2af1e01fb5eca8033"
  head "https://github.com/k24d/ssm-vault.git", :branch => "master"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X main.Version=#{pkg_version} -s -w", "-trimpath", "-o", "ssm-vault"
    bin.install "ssm-vault"
  end

  test do
    system "ssm-vault", "--version"
  end
end
