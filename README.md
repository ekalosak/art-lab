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
