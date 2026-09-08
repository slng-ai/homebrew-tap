class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.18/voiceai-darwin-arm64"
      sha256 "93365905c25a0e948e7f7017075d453bb79bab4c1080f1fae1b162c86607cde1"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.18/voiceai-darwin-x64"
      sha256 "02be6d1d801b6549280841cc0d730d7cd24a2200694a8ce78ab8b651675fb79e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.18/voiceai-linux-arm64"
      sha256 "7753d6908eedc4fa7c2afb9fc9a0cc0b8e2a65a83ba3784121af47a2bbbebc0c"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.18/voiceai-linux-x64"
      sha256 "86c5ae00bb38c8724fe4a99092fc14cabfa996a570db693b8f082cf510b1a921"
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
