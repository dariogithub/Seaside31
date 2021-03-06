baselines
baselineadaptors: spec
  spec
    for: #'common'
    do: [ 
      spec blessing: #'baseline'.
      spec
        project: 'Swazoo2'
        with: [ 
          spec
            versionString: #'stable';
            className: 'ConfigurationOfSwazoo2';
            loads: #('Swazoo');
            repository: 'http://smalltalkhub.com/mc/Swazoo/Swazoo/main' ].
      spec
        package: 'Zinc-Seaside'
        with: [ spec requires: #('Zinc Project' 'Seaside-Core') ].
      spec
        package: 'Seaside-Swazoo'
          with: [ 
              spec
                requires: #('Grease' 'Swazoo2');
                repository:
                    'http://smalltalkhub.com/mc/Seaside/Seaside30LGPL/main' ];
        package: 'Seaside-Adaptors-Swazoo'
          with: [ spec requires: #('Seaside-Core' 'Seaside-Swazoo') ].
      spec
        group: 'Swazoo' with: #('Seaside-Adaptors-Swazoo');
        group: 'Zinc' with: #('Zinc-Seaside') ].
  spec
    for: #'squeakCommon'
    do: [ 
      spec repository: 'http://smalltalkhub.com/mc/Seaside/Seaside31/main'.
      spec
        project: 'Zinc Project'
        with: [ 
          spec
            versionString: #'stable';
            className: 'ConfigurationOfZincHTTPComponents';
            repository: 'http://mc.stfx.eu/ZincHTTPComponents' ].
      spec
        project: 'WebClient Project'
        with: [ 
          spec
            versionString: '1.5';
            className: 'ConfigurationOfWebClient';
            loads: #('Core');
            repository: 'http://ss3.gemtalksystems.com/ss/WebClient' ].
      spec
        package: 'WebClient-Seaside'
        with: [ 
          spec repository: 'http://ss3.gemtalksystems.com/ss/WebClient'.
          spec requires: #('WebClient Project' 'Seaside-Core') ].
      spec group: 'WebClient' with: #('WebClient-Seaside') ].
  spec
    for: #(#'squeak' #'pharo1.x')
    do: [ 
      spec
        package: 'WebClient-Seaside'
        with: [ spec requires: #('OB' 'Seaside-Tools-OmniBrowser') ] ].
  spec
    for: #'pharo'
    do: [ 
      spec project: 'Zinc Project' with: [ spec loads: #('Zinc-HTTP') ].
      spec
        package: 'Seaside-Adaptors-Comanche'
          with: [ spec requires: #('KomHttpServerLight' 'Seaside-Core') ];
        package: 'KomHttpServerLight'
          with: [ spec repository: 'http://www.smalltalkhub.com/mc/Seaside/KomHttpServer/main' ];
        package: 'Seaside-Tests-Adaptors-Comanche'
          with: [ spec requires: #('Seaside-Adaptors-Comanche') ].
      spec
        group: 'Kom' with: #('Seaside-Adaptors-Comanche');
        group: 'Comanche' with: #('Seaside-Adaptors-Comanche') ].
  spec
    for: #'pharo1.x'
    do: [ 
      spec
        package: 'Seaside-Tests-Adaptors-Comanche'
        with: [ spec requires: #('Seaside-Tests-Pharo-Core') ] ].
  spec
    for: #'gemstone'
    do: [ 
      spec
        project: 'FastCGI Project'
          with: [ 
              spec
                className: 'ConfigurationOfGsFastCGI';
                versionString: #'stable';
                loads: #('FastCGI');
                repository:
                    'http://seaside.gemtalksystems.com/ss/MetacelloRepository' ];
        baseline: 'GsApplicationTools'
          with: [ 
              spec
                loads: 'Core';
                repository:
                    'github://GsDevKit/gsApplicationTools:v1.?/repository' ];
        baseline: 'Zinc Project'
          with: [ 
              spec
                className: 'BaselineOfZincHTTPComponents';
                loads: #('Zinc-HTTP' 'Core');
                repository: 'github://GsDevKit/zinc:v2.4.3.?/repository' ];
        yourself.
      spec
        package: 'Seaside-GemStone-GemServer-Core'
          with: [ spec requires: #('GsApplicationTools' 'Seaside-Core') ];
        package: 'Seaside-GemStone-GemServer-Tests'
          with: [ 
              spec
                requires:
                  #('Seaside-GemStone-GemServer-Core' 'Seaside-GemStone-Development' 'Seaside-GemStone-Adaptors-Swazoo' 'Seaside-GemStone-Adaptors-Zinc' 'Seaside-Adaptors-FastCGI') ];
        package: 'Seaside-Adaptors-Swazoo'
          with: [ spec includes: #('Seaside-GemStone-Adaptors-Swazoo') ];
        package: 'Zinc-Seaside'
          with: [ spec includes: #('Seaside-GemStone-Adaptors-Zinc') ];
        package: 'Seaside-Adaptors-FastCGI'
          with: [ 
              spec
                requires:
                  #('Seaside-Core' 'FastCGI Project' 'Seaside-GemStone-GemServer-Core') ];
        package: 'Seaside-GemStone-Adaptors-Swazoo'
          with: [ spec requires: #('Seaside-Adaptors-Swazoo' 'Seaside-GemStone-GemServer-Core') ];
        package: 'Seaside-GemStone-Adaptors-Zinc'
          with: [ spec requires: #('Zinc-Seaside' 'Seaside-GemStone-GemServer-Core') ].
      spec
        group: 'FastCGI' with: #('Seaside-Adaptors-FastCGI');
        group: 'Tests' with: #('Seaside-GemStone-GemServer-Tests');
        yourself ]