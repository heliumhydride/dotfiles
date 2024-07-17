@echo off

for %%I in (%*) do (
	yt-dlp -x -o "%%(title)s.%%(ext)s" --audio-format mp3 -- %%I
)
