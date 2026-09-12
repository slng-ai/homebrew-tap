class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.19/voiceai-darwin-arm64"
      sha256 "1bb474c681cf6b3900412479a240592de291d186d17e6c8b43071e37a9ba1251"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.19/voiceai-darwin-x64"
      sha256 "efe40c0b9b19144e50bd2516810cbc6dcc66b3f53f535289e2630d0605a8402a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.19/voiceai-linux-arm64"
      sha256 "251d05a612fc881aba084f14a3c4ad0cf585d253c9b35c0b3df3b73e7a8996bd"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.19/voiceai-linux-x64"
      sha256 "f8cf0006e7f5ddf0165bd91ae6a32a8d1bdad20200f06c4e8f96f1f9ea646b6b"
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
