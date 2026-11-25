class CantonRs < Formula
  desc "Single-binary, zero-JVM Rust runtime for Canton & Splice"
  homepage "https://getcantonrs.dev"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cantonrs/canton-rs/releases/download/v0.8.0/canton-rs-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "5e1525fc33bf0f005ba7f71fd1d5c13821d5cde53374d37b8f20218acbbba12b"
    else
      url "https://github.com/cantonrs/canton-rs/releases/download/v0.8.0/canton-rs-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "2028fd6018b6def23ca84baef86810cd2bc9af324fee4213de5ceacb4fdcce95"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cantonrs/canton-rs/releases/download/v0.8.0/canton-rs-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8c2ba32b29e4b1226e655ba102f2529f08f415a3854b1057ff885791fc7506d4"
    else
      url "https://github.com/cantonrs/canton-rs/releases/download/v0.8.0/canton-rs-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "17ebe6568362890167c97e7e8e42a12a03a503497451f7549e7f1630cd6a5f52"
    end
  end

  def install
    bin.install "canton-rs"
    doc.install "LICENSE-APACHE", "NOTICE"
    doc.install "README.md" if File.exist?("README.md")
  end

  test do
    assert_match "0.8.0", shell_output("#{bin}/canton-rs --version")
  end
end
