# Desert Lizard board
Copyright © 2015 Bart Massey

Welcome to the *Desert Lizard*, an open-hardware open-source
beginner e-jewelry project.

## Overview

The DL is a first prototype of a project with a
couple of purposes:

* The DL is an easy, cheap first board for beginners to assemble
  and make that does something interesting. It features
  near-foolproof frying-pan surface-mount construction with
  only a couple of through-hole components to mess with (see
  *Speaker* below). The project will be used in tutorial
  classes on electronic construction.

* The DL is the heart of a piece of e-jewelry that, with the
  right programming and a pretty case, should be a lot of
  fun to play with and wear. The intent is to put a ceramic
  lizard case on it and wear it as an interactive pendant.

The DL is built around the
[Silicon Labs EFM8BB1](http://www.silabs.com/Support%20Documents/TechnicalDocs/EFM8BB1_DataSheet.pdf)
microcontroller. This 8051-API SoC is a little over 50 cents
quantity one, and has a *lot* of nice peripherals and
general purpose pins. The 8BB1 also happens to come in a nice
"large" 16-pin SOIC package for ease of soldering. The
processor will run nicely on less than 3 volts, which is
great for battery operation.

The DL is battery-powered, currently with a CR2032 primary
button battery. This battery is too large, and primary is
not a good thing here, but it keeps the cost low and is
readily accessible.

Components have been chosen as 1206 SMD where possible. This
is kind of expensive even compared to 0805, but gives the
possibility of a person with normal vision and coordination
being able to drop parts without a magnifier.

## Interactivity

The fun of the DL is its interactivity. The current
incarnation has one input and two outputs.

### LEDs

LEDs are used to light up the eyes and body of the lizard
when desired.

Because there is only about 2.4V of headroom, there are no
cheap blue LEDs available. Thus, discrete red and green LEDs
are be placed near each other on the board, giving some
color control. It is expected that these LEDs will be PWMed
for brightness. The current LEDs are 0805-sized J-lead
parts, because of a screwup—they require a 4x4mm heat
dissipation pad on each terminal, but can generate 100mcd of
light at 20mA. They will shortly be replaced with more
conventional 1206 LEDs that are more like 40mcd at 20mA, but
are easier to drop and don't require so much board space.

### Speaker

A speaker is used so that the lizard can make noises when
desired.

It turns out that I could find exactly one tiny magnetic
speaker at a reasonable price. Sadly, it's through-hole, but
I'll live with that for now while I decide what might be
done differently.

### Capacitive Touch

Capacitive touch sensors allow the lizard to respond to
touches without moving parts.

The current incarnation of the DL has two capacitive touch
pads intended for a short sensing wire each. This allows
partial differential operation to improve noise rejection,
or simply having more than one input. The pins have been
chosen such that the internal comparator of the 8BB1 can be
used for RC-mode sensing. There is a voltage reference
supplied to the other comparator pin in case the internal
reference doesn't work out.

## Status

This board is currently undergoing final review before being
sent to [OSHPark](http://oshpark.org) for prototype
production. Right now, the board itself is the single
biggest expense, even at OSHPark prices: at $5/sq-in for 3
boards, this 2.5 sq-in board costs a little under $5.

It is expected that most of the passives on the current
board are actually unnecessary:

* The 20 ohm current limiting resistors for the LEDs should
  be avoidable with careful PWM.

* If the PWM for the speaker can be made to do out-of-phase
  drive on two pins, the expensive blocking capacitor can be
  omitted.

* There may be enough leakage current to avoid the drain
  resistors in the RC touch system.

* The power supply filtering is almost certainly unnecessary
  on a battery-powered board.

* The reset pull-up is recommended by Silicon Labs, but is
  likely to be unneeded as there is a small internal pull-up
  resistor.

It is hoped that the cost, size and complexity of the board
will be reduced thereby.

No software has yet been written for this project. The
process of identifying how to develop for the 8BB1 is
ongoing, and tools and infrastructure are being assembled.

Case construction is in the contemplation phase. A sketchy
plan involving plastic molds for ceramic cases is floating
around.

## License

The hardware design and source code for this project is
available under the MIT License. See the file COPYING in
this distribution for license terms.
