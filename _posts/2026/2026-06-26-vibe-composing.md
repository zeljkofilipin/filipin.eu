---
tags:  image
title: Vibe Composing With Claude Code
---
![Vibe Composing With Claude Code](assets/2026/vibe-composing.jpg "Vibe Composing With Claude Code")

Thanks to [Karlo Šmid](https://karlosmid.com/) for the photo. Used with permission.

## The Idea

I wanted to give a five minute lightning talk in April at [Testival Meetup \#80](testival-80). [AI](https://en.wikipedia.org/wiki/Artificial_intelligence) is a topic everybody talks about these days. I play a few instruments. I'll ask an AI for advice on how to write a song. Then, iterate with the AI over the song, live, in front of the audience. When I practiced it, it took hours, not minutes. I did not give up on the idea, but I had to significantly simplify it.

## The Plan

At home:

* Ask an AI for advice on writing a song.
* Ask it to generate sample [tablatures](https://en.wikipedia.org/wiki/Tablature) for a song.
* Prerecord the bassline and the guitar chords.

At the event:

* Play the prerecorded part from a computer.
* Play the guitar solo live.

All music has to be composed and performed by me. I can only ask AI for advice. I can never follow its advice blindly.

## Vibe Composing Git Repository

There are several popular AI tools. I have decided to use Claude Code. (Just Claude from now on.) I don't know which model I used at the time, but it was probably Opus 4.6.

I thought it would be funny to ask a tool optimized to create code, to create tablatures instead. Both are just text, after all. What could possibly go wrong?\!

After some conversations with Claude, we decided to compose a simple rock song in [C major](https://en.wikipedia.org/wiki/C_major). The chords are C, Am, Dm, F and G.

I have created a git repository, [vibe-composing](https://github.com/zeljkofilipin/vibe-composing). I decided to experiment with all the stringed instruments I have. Bass, guitar and ukulele. For each instrument, I asked Claude to generate a fretboard, a scale and both a simple and an advanced solo.

In addition to those, I asked it to generate the music I would play in the song. For example, a bassline for the bass, and the chords for the guitar.

## What Didn’t Go So Well

At the time, I didn't think I would write a blog post about it, so I didn't save the conversations I had with Claude. That would be a fun read. A lot of the time I was complaining about mistakes it made.

Even when asking for very simple tablatures, it was getting things wrong. For example, it would mess up [whitespace](https://github.com/zeljkofilipin/vibe-composing/commit/aee38e4a535768ecd8c56f823994088131ac5e1b). Tablatures are read by humans, so whitespace is not significant. Except, nicely formatted text is much easier to read.

At one point I realized the bassline was so wrong, on so many levels. I decided to [start over](https://github.com/zeljkofilipin/vibe-composing/commit/d598dbc96ee6cf3f9ba53e0ff24a6bf3175b15f3). This time, I would record the mistakes. For a very simple bassline, it got [two notes wrong](https://github.com/zeljkofilipin/vibe-composing/commit/4e9bd66ef54312114170ba4d1def4a432a1e1562). Then I noticed [one more wrong note](https://github.com/zeljkofilipin/vibe-composing/commit/9b41128d54dc36154b6ce8d4773cebf5a94f93b7). Also, the text was [not formatted correctly](https://github.com/zeljkofilipin/vibe-composing/commit/e6a2e3c7911fd7b7e304564eaad1e95f25e5372a). All of that for just a very simple bassline.

(While writing the article, I took another look at the tablatures. Some of them are still wrong, in various ways. I didn't have the time to fix them. Please report an issue on GitHub if you find something wrong in the tablatures.)

## What Worked Well

Out of all tablatures it created, [fretboards](https://github.com/zeljkofilipin/vibe-composing/blob/master/guitar-fretboard.txt) were the most useful. (It shows where each note is on each string.) I used the guitar fretboard to practice the solo. There are plenty of fretboards available online. With a tool like Claude Code, you can create a custom one. Just for your instrument: type of the instrument, number of strings, number of frets, tuning...

## Performance

I didn't have the time to check how my computer and guitar would sound in the room. It was a big, noisy room. Both my computer and small portable guitar amplifier that I had were not even close to being loud enough. I'm not sure if anybody heard anything. Lesson learned for the eventual next time. Bigger speakers. Check the sound in the room before the event.

That said, I did have a lot of fun playing live in front of a small friendly audience. I would do it again. If you would like to hear a funny talk about using an AI to help you create music, let me know.

## Conclusion

I was not impressed with Claude's ability to create tablatures. Even for very simple tablatures, it was getting things wrong. It was doing almost ok for chords and scales, but I was not at all impressed with the solos it created. For none of the instruments.

I do understand I was using a tool optimized for generating code to generate tablatures. That was the point of the experiment.

It was a fun experiment. As with every experiment, I need to work on it more. I had very limited time for it, just a few hours. So, the experiment is in a half-finished stage. I'll experiment more in the future, if some magical free time falls from the sky.

## Handcrafted

No AI was used in writing this article. I wrote it the old fashioned way. Start with a blank page. Every single letter, word, sentence and paragraph was created by me and typed by me. I do use grammar and spell checking, but that's all.
