/*
This is an example startup file.
If you want to modify it, best copy it elsewhere to keep the git repository clean.

You can then load it by calling
"path/to/my/superdirt_startup.scd".load
from the supercollider startup file

The supercollider startup file is to be found in
Platform.userAppSupportDir +/+ "startup.scd",
or via the menu File > Open startup file
*/


(
s.reboot { // server options are only updated on reboot
	// configure the sound server: here you could add hardware specific options
	// see http://doc.sccode.org/Classes/ServerOptions.html
	s.options.numBuffers = 1024 * 256; // increase this if you need to load more samples
	s.options.memSize = 8192 * 32; // increase this if you get "alloc failed" messages
	s.options.numWireBufs = 2048; // increase this if you get "exceeded number of interconnect buffers" messages
	s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"
	s.options.numOutputBusChannels = 2; // set this to your hardware output channel size, if necessary
	s.options.numInputBusChannels = 2; // set this to your hardware output channel size, if necessary
	// boot the server and start SuperDirt
	s.waitForBoot {
		~dirt.stop; // stop any old ones, avoid duplicate dirt (if it is nil, this won't do anything)
		~dirt = SuperDirt(2, s); // two output channels, increase if you want to pan across more channels
		~dirt.loadSoundFiles;   // load samples (path containing a wildcard can be passed in)
		// for example: ~dirt.loadSoundFiles("/Users/myUserName/Dirt/samples/*");
		// s.sync; // optionally: wait for samples to be read
		~dirt.start(57120, 0 ! 12);   // start listening on port 57120, create two busses each sending audio to channel 0
		SuperDirt.default = ~dirt; // make this instance available in sclang (optional)

		// optional, needed for convenient access from sclang:
		(
			~d1 = ~dirt.orbits[0]; ~d2 = ~dirt.orbits[1]; ~d3 = ~dirt.orbits[2];
			~d4 = ~dirt.orbits[3]; ~d5 = ~dirt.orbits[4]; ~d6 = ~dirt.orbits[5];
			~d7 = ~dirt.orbits[6]; ~d8 = ~dirt.orbits[7]; ~d9 = ~dirt.orbits[8];
			~d10 = ~dirt.orbits[9]; ~d11 = ~dirt.orbits[10]; ~d12 = ~dirt.orbits[11];
		);

		// directly below here, in your own copy of this file, you could add further code that you want to call on startup
		// this makes sure the server and ~dirt are running
		// you can keep this separate and make it easier to switch between setups
		// by using "path/to/my/file.scd".load and if necessary commenting out different load statements
		// ...


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


		//SAMPLES
		(

			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Haskwave/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/OST Audio - Free Synthwave Drums/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo - 80s Drum Machines/E-muDrumulator/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo - 80s Drum Machines/KorgDDD-1/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo - 80s Drum Machines/LinnLinn9000/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo - 80s Drum Machines/LinnLinnDrum/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo - 80s Drum Machines/OberheimDMX/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo - 80s Drum Machines/RolandR8/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo - 80s Drum Machines/RolandTR-626/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo - 80s Drum Machines/RolandTR-707/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo - 80s Drum Machines/SCIDrumTraks/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo - 80s Drum Machines/SimmonsSDSV/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo - 80s Drum Machines/YamahaRX5/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/AJKPercusyn/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/AkaiLinn/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/AkaiMPC60/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/AkaiXR10/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/AlesisHR16/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/AlesisSR16/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/BossDR110/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/BossDR220/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/BossDR55/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/BossDR550/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/BossDR660/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/CasioRZ1/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/CasioSK1/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/CasioVL1/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/DoepferMS404/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/EmuDrumulator/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/EmuModular/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/EmuSP12/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/KorgDDM110/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/KorgKPR77/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/KorgKR55/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/KorgKRZ/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/KorgM1/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/KorgMinipops/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/KorgPoly800/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/KorgT3/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/Linn9000/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/LinnDrum/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/LinnLM1/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/LinnLM2/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/MFB512/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/MoogConcertMateMG1/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/MPC1000/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/OberheimDMX/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RhodesPolaris/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RhythmAce/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandCompurhythm1000/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandCompurhythm78/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandCompurhythm8000/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandD110/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandD70/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandDDR30/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandJD990/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandMC202/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandMC303/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandMT32/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandR70/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandR8/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandS50/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandSH09/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandSystem100/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandTR505/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandTR606/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandTR626/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandTR707/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandTR727/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandTR808/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/RolandTR909/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/SakataDPM48/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/SequentialCircuitsDrumtracks/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/SequentialCircuitsTom/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/SergeModular/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/SimmonsSDS400/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/SimmonsSDS5/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/SoundmastersR88/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/UnivoxMicroRhythmer12/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/ViscoSpaceDrum/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/XdrumLM8953/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/YamahaRM50/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/YamahaRX21/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/YamahaRX5/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/YamahaRY30/*");
			~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/tidal-drum-machines/machines/YamahaTG33/*");

		);

		//SIDECHAINING
		(

			~sidechains = Dictionary.new;

			~makeSidechain = { |sourceOrbit, controlOrbit, slopeAbove, clampTime, relaxTime|
				var key, bus, ndefName;
				key = sourceOrbit.asString ++ "," ++ controlOrbit.asString;
				if (~sidechains[key].notNil) { ~clearSidechain.(sourceOrbit, controlOrbit); };
				bus = Bus.audio(s, 2);
				~dirt.orbits[sourceOrbit].outBus = bus;
				ndefName = ("sidechain_" ++ sourceOrbit ++ "_" ++ controlOrbit).asSymbol;
				Ndef(ndefName, {
					var control = InBus.ar(~dirt.orbits[controlOrbit].dryBus, 2).sum;
					var source = InBus.ar(bus, 2);
					Compander.ar(
						source,
						control,
						thresh: 0.001,
						slopeBelow: 1,
						slopeAbove: slopeAbove,
						clampTime: clampTime,
						relaxTime: relaxTime
					);
				}).play;
				~sidechains[key] = (bus: bus, ndef: ndefName);
				("Created sidechain: orbit % controlled by orbit %".format(sourceOrbit, controlOrbit)).postln;
			};

			~clearSidechain = { |sourceOrbit, controlOrbit|
				var key = sourceOrbit.asString ++ "," ++ controlOrbit.asString;
				var sidechain = ~sidechains[key];
				if (sidechain.notNil)
				{
					Ndef(sidechain[\ndef]).clear;
					~dirt.orbits[sourceOrbit].outBus = 0;
					sidechain[\bus].free;
					~sidechains.removeAt(key);
					("Removed sidechain: orbit % controlled by orbit %".format(sourceOrbit, controlOrbit)).postln;
				};
			};

			~clearAllSidechains = {
				var orbits, sourceOrbit, controlOrbit;
				var keys = ~sidechains.keys;
				keys.do { |key|
					orbits = key.split($,);
					sourceOrbit = orbits[0].asInteger;
					controlOrbit = orbits[1].asInteger;
					~clearSidechain.(sourceOrbit, controlOrbit)
				};
				~sidechains.clear;
				("Cleared all sidechains").postln;
			};

			OSCdef(\makeSidechain, { |msg|
				var sourceOrbit = msg[1];
				var controlOrbit = msg[2];
				var slopeAbove = msg[3] ? 0.5;
				var clampTime = msg[4] ? 0.05;
				var relaxTime = msg[5] ? 0.1;
				~makeSidechain.(sourceOrbit, controlOrbit, slopeAbove, clampTime, relaxTime);
			}, '/makeSidechain');

			OSCdef(\clearSidechain, { |msg|
				var sourceOrbit = msg[1];
				var controlOrbit = msg[2];
				~clearSidechain.(sourceOrbit, controlOrbit);
			}, '/clearSidechain');

			OSCdef(\clearAllSidechains, { |msg|
				~clearAllSidechains.();
			}, '/clearAllSidechains');

		);

		//SYNTHESIZERS
		(

			SynthDef(\moogan, { |out, pan, accelerate, freq, speed, decay=0, sustain=1, waveform=0, unison=1, detune=0, scatter=0, lfo=1, rate=1, resonance=0.25, pulse=0.5|

				var env = EnvGen.ar(Env.pairs([[0,0], [0.05,1], [0.2,1-decay], [0.95,1-decay], [1,0]], -3), timeScale:sustain, doneAction:2);

				var frequency = freq * DirtFreqScale.kr(speed, accelerate, sustain);

				var scScatter = scatter * 2;
				var divisions = max(unison - 1, 1);
				var detuneFirst = frequency - (detune / 2 * frequency);
				var scatterFirst = 0 - (scScatter / 2);
				var detuneStep = detune / divisions * frequency;
				var scatterStep = scScatter / divisions;

				var multiplier = Select.kr(waveform, [1, 10, 10, 10]); //sine waves have no harmonics above base frequency
				var lowerLFO = min(frequency * multiplier, 22000);
				var upperLFO = min(lowerLFO * (lfo + 1), 22000);

				var input = (1 / unison) * Mix.arFill(16, { |i|
					var active = i < unison; //this produces a UGen comparison signal, not a primitive boolean
					Pan2.ar(
						(Select.ar(waveform, [
							SinOsc.ar(detuneFirst + (detuneStep * i)),
							LFTri.ar(detuneFirst + (detuneStep * i)),
							Pulse.ar(detuneFirst + (detuneStep * i), pulse),
							SawDPW.ar(detuneFirst + (detuneStep * i))
						])) * active,
						scatterFirst + (scatterStep * i)
					);
				});

				var oscillation = Select.kr(waveform, [
					SinOsc.kr(frequency / 64 * rate, 0).range(lowerLFO, upperLFO),
					LFTri.kr(frequency / 64 * rate, 0.5).range(lowerLFO, upperLFO),
					SinOsc.kr(frequency / 64 * rate, 0).range(lowerLFO, upperLFO),
					LFTri.kr(frequency / 64 * rate, 0.5).range(lowerLFO, upperLFO),
				]);

				var sound = MoogFF.ar(input, oscillation, resonance * 4);
				sound = sound.tanh * 2;
				
				Out.ar(out, DirtPan.ar(sound, ~dirt.numChannels, pan, env));

			}).add;

		);


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	};

	s.latency = 0.3; // increase this if you get "late" messages

};
);