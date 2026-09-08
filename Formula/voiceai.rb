class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.17/voiceai-darwin-arm64"
      sha256 "fea97d319ec24353a6c7aca0f05f6f534203ecb41c747c68ea593f57a4c9edb3"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.17/voiceai-darwin-x64"
      sha256 "ab00044818d9ee8ace3cf3648de97e9ee7345e44d704622469a82a0e1014fbbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.17/voiceai-linux-arm64"
      sha256 "0ab863548b1bc15dc9d220e0b86531539829ba7e2c5dad3091b02fb94bf21c49"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.17/voiceai-linux-x64"
      sha256 "eeaa5e14c14a84679be359b7cb1faf353218ec5a572190d24129602cc288165b"
    end
  end

  depends_on "sox" => :recommended  # required for STT mic recording

  def install
    bin.install Dir["voiceai-*"].first => "voiceai"
  end

  def caveats
    <<~EOS
      Config lives at ~/.config/voiceai/ and is NOT removed by `brew uninstall`.
      To wipe it (and the legacy ~/.config/slng/) before uninstalling, run:
        voiceai config reset --force
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/voiceai --version")
  end
end
