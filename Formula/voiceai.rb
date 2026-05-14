class Voiceai < Formula
  desc "Voiceai CLI — text-to-speech, speech-to-text, streaming"
  homepage "https://slng.ai"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.6/voiceai-darwin-arm64"
      sha256 "3ea3f27d54e201427c1b586af87212311280fce63479722646810b6776c19314"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.6/voiceai-darwin-x64"
      sha256 "366c47cefa3cfd5df58c7ca031a5f151cec1bf58063a19267d4a1e557806879c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.6/voiceai-linux-arm64"
      sha256 "2f0a57e8710d66d8d76b654af82417ae0f61bd9b0f1e137b06a8dcd51c6cb060"
    else
      url "https://github.com/slng-ai/sdks/releases/download/cli-v0.1.6/voiceai-linux-x64"
      sha256 "544c00c62eeda5d48e76773a5e707cf1bea4993741621a3251f011806fd247b4"
    end
  end

  depends_on "sox" => :recommended  # required for STT mic recording

  def install
    bin.install Dir["voiceai-*"].first => "voiceai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/voiceai --version")
  end
end
