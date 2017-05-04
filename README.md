# art-lab

"Restrictions make the best art."

This package will eventually contain the monads required for
    Steve Riech & Phillip Glass inspiried art creation.
    That is, rules bound only by the progression of time
    into the future as defined by musical progression,
    video movement, and left-to-right reading of texts will
    be arbitrarily (deterministic or stochastic or a mix)
    plug-and-playable, mix-and-matchable for a universal
    art creation package. The category of rule-based
    art creation objects is a monoid under the time
    progression morphism.

While this is a project meant to make the use of functional
    programming paradigm, I will use an imperative/OO
    language to describe the components of the system.

OBJECTS:
1. Collective: the set of artists, outlets, and parameters
    used to describe the composition of subobjects and their
    interactions. Sums voices of individual artists into
    blips @time=t and pipes them to the outlet.
2. Outlet: renders digital representations to physical
    analog actions e.g., a WAV file to sound. This is
    the most IO, system, hardware oriented object.
    E.g., a canvas, a boombox, or a page.
3. Artist: has instruments, knowledge of the collective,
    an urge to create, a bag of tools, and behavior 
    dictated by rules. Has metarule dictating the selection
    of an instrument and a rule by which to generate
    behavior. E.g., musician, painter, or poet.
4. Tool: takes input from the artist in the form of a
    behavior and generates output in the form of a voice.
    e.g., a musical instrument, a paintbrush, or a
    dictionary.
5. Rule:
    1. Metarule: one per artist, dictates tool choice 
        and playrule choice.
    2. Playrule: an artist may have arbitrarily many,
        dictates how to generate behaviors given
        the state of the collective i.e., time, global
        parameters, the states of the other artists, etc.
    3. Timerule: the collective has this, forces time fwd.
6. Behavior: e.g., a note, a brushstroke, or a word. The
    thing an artist makes at a given time in a set of
    circumstances. This is the interface between the artist
    and her tool.
7. Parameter: e.g., time, a prime seed, etc. Things that
    inform the creation of behaviors by artists, the

ARROWS:
1. Time morphism: Collective@t -> Collective@t+1.
    Propogates changes through the collective.

INSPIRATION:
Philip Glass's "Metamorphosis" and "Symphony 2",
Steve Riech's "Electric Counterpoint",
Rothko's entire portfolio,
Lorenz's waterweel and strange attractors,
Category theory e.g., Goodwillie calculus and
    Dmitry Vagner's work,
Haskell's category theoretical construction,
Charlie Roberts at UC Santa Barbra,
Electric Sheep,

STRUCTURE:
This package is structured according to the outline provided
    on:
    https://wiki.haskell.org/Structure_of_a_Haskell_project

MODULE IDEAS:
1. Songs
    1.1 Emulate Knee Play 1 by P Glass off of Einstein o t Beach, Vocal numbers
    and organ instruments, fugue of text read by e.g. computer
    1.2 Dan Deacon, Panda Bear
2. Build library of parameterized instruments and a framework for coordinating
   them
    2.1 Noise, synths, sample manipulators, signal mimickers, text readers
    2.2 Need filters e.g. apply envelopes like drum amplitude to synth amp,
    reverb, low pass, etc.
        2.2.1 Two major classes: synthesizers and patches
            Synth takes Music Pitch, parameters and returns waveform
                E.g. sinewave
            Patch takes waveform, parameters and returns waveform
                E.g. low pass, 8bit-ify, punch, fuzz, reverb, vibrato, trill,
                embelleshment, autoregressive harmonizing, harmonizer, octave as
                special case of harmonizer
    2.3 Drums
        Just a synthesizer - takes Music Pitch and makes waveform
        2.3.1 Wishlist: hihat, toms, snare, bass all parameterized
    2.4 The coordination framework is a module
3. Image processor (e.g. NN) that passes different signals based on different
   learned and/or engineered image features to a collection of instrumentalists
   who play based on their own imperitive and the image. In a sense, this
   "soundifies" images / video.
   3.1 Feedback image generation based on the music created from the image
   3.2 Musicify signals from a game of Go or Chess or tic tac toe
