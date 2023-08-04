@echo off

for %%I in (%*) do (
	yt-dlp -x --audio-format mp3 %%I
)
