# Must set synth input to bus 2, synth output to bus 1
#   and even then you might have to fiddle with Output() and Input() args

## Useful sources
# https://audiodestrukt.wordpress.com/2013/06/23/midi-programming-in-python/

print("importing")
import pygame.midi
import pygame.time
import time

print("setting up")
pygame.midi.init()
player = pygame.midi.Output(3)
player.set_instrument(0)
print("player",player)
reader = pygame.midi.Input(0)
print("reader",reader)

for i in range(500):
    print(i)
    play = False
    if reader.poll():
        notes = reader.read(10)
        play = True
        print(notes)

    pygame.time.wait(10)

    if play:
        for note in notes:
            n = [note[0][1], note[0][2]]
            print("playing", n)
            player.note_on(*n)
            time.sleep(0.5)
            player.note_off(*n)


# Clean up
player.close()
reader.close()
pygame.midi.quit()
