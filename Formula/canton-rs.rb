class CantonRs < Formula
  desc "Single-binary, zero-JVM Rust runtime for Canton & Splice"
  homepage "https://getcantonrs.dev"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cantonrs/canton-rs/releases/download/v0.8.1/canton-rs-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "f611f5483d96af80860a5a903f978e5348f5df1b8d61d898ebdc43250a60a429"
    else
      url "https://github.com/cantonrs/canton-rs/releases/download/v0.8.1/canton-rs-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "f801f0ea70b41f3435773a71fb485a621e50bb5e18544921ec5f10044874b706"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cantonrs/canton-rs/releases/download/v0.8.1/canton-rs-v0.8.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "160dfaf03d5c3239e6ef9bd7cf279bb28b830ce1c9ec758d70b855887f34bccb"
    else
      url "https://github.com/cantonrs/canton-rs/releases/download/v0.8.1/canton-rs-v0.8.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "895c8b9de017680f0f61cf7def35b0dd7c3150180c5a45945f17d5afa4cf2c0a"
    end
  end

  def install
    bin.install "canton-rs"
    doc.install "LICENSE-APACHE", "NOTICE"
    doc.install "README.md" if File.exist?("README.md")
  end

  test do
    assert_match "0.8.1", shell_output("#{bin}/canton-rs --version")
  end
end
