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

		//LOAD SAMPLES
		~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/OST Audio - Free Synthwave Drums/*");
		~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo 80s Drum Machines/E-muDrumulator/*");
		~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo 80s Drum Machines/KorgDDD-1/*");
		~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo 80s Drum Machines/LinnLinn9000/*");
		~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo 80s Drum Machines/LinnLinnDrum/*");
		~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo 80s Drum Machines/OberheimDMX/*");
		~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo 80s Drum Machines/RolandR8/*");
		~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo 80s Drum Machines/RolandTR-626/*");
		~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo 80s Drum Machines/RolandTR-707/*");
		~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo 80s Drum Machines/SCIDrumTraks/*");
		~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo 80s Drum Machines/SimmonsSDSV/*");
		~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Synthwave Dojo 80s Drum Machines/YamahaRX5/*");
		~dirt.loadSoundFiles("D:/Programming/GitHub Projects/Haskwave/samples/Vocals/*");

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
				var sc = ~sidechains[key];
				if (sc.notNil)
				{
					Ndef(sc[\ndef]).clear;
					~dirt.orbits[sourceOrbit].outBus = 0;
					sc[\bus].free;
					~sidechains.removeAt(key);
					("Removed sidechain: orbit % controlled by orbit %".format(sourceOrbit, controlOrbit)).postln;
				};
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

		)

	};

	s.latency = 0.3; // increase this if you get "late" messages


};
);