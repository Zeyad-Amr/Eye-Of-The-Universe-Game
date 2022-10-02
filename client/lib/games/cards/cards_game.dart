import 'package:flutter/material.dart';

class Game {
  final Color hiddenCard = Colors.red;
  List<Color>? gameColors;
  List<Map<String, dynamic>>? gameImg;
  List<Color> cards = [
    Colors.green,
    Colors.yellow,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blue
  ];
  final String hiddenCardpath = "assets/inst/hidden.jpg";

  List<Map<String, dynamic>> cardss = [
    {
      'path': "assets/inst/fgs.jpg",
      'title': 'FGS-NIRISS',
      'description':
          'The FGS will help the telescope aim and stay pointed at whatever it is commanded to look at.\nFGS helps provide data to the JWST Attitude Control System (ACS) and to do this it has a big sky coverage and sensitivity, to give a high probability it can find a guide star.\nNIRISS is designed for performing: Near-infrared imaging, Wide-field slitless spectroscopy, Single object slitless spectroscopy, Aperture masking interferometry'
    },
    {
      'path': "assets/inst/fgs.jpg",
      'title': 'FGS-NIRISS',
      'description':
          'The FGS will help the telescope aim and stay pointed at whatever it is commanded to look at.\nFGS helps provide data to the JWST Attitude Control System (ACS) and to do this it has a big sky coverage and sensitivity, to give a high probability it can find a guide star.\nNIRISS is designed for performing: Near-infrared imaging, Wide-field slitless spectroscopy, Single object slitless spectroscopy, Aperture masking interferometry'
    },
    {
      'path': "assets/inst/miri.jpg",
      'title': 'MIRI',
      'description':
          'Mid-Infrared Instrument, is an instrument on the James Webb Space Telescope.Mid-Infrared Instrument, is an instrument on the James Webb Space Telescope.\nMIRI is a camera and a spectrograph that observes mid to long infrared radiation from 5 to 28 microns.\nIt also has coronagraphs, especially for observing exoplanets.\nWhereas most of the other instruments on Webb can see from the start of near infrared, or even as short as orange visible light, MIRI can see longer wavelength light.'
    },
    {
      'path': "assets/inst/miri.jpg",
      'title': 'MIRI',
      'description':
          'Mid-Infrared Instrument, is an instrument on the James Webb Space Telescope.Mid-Infrared Instrument, is an instrument on the James Webb Space Telescope.\nMIRI is a camera and a spectrograph that observes mid to long infrared radiation from 5 to 28 microns.\nIt also has coronagraphs, especially for observing exoplanets.\nWhereas most of the other instruments on Webb can see from the start of near infrared, or even as short as orange visible light, MIRI can see longer wavelength light.'
    },
    {
      'path': "assets/inst/nircam.jpg",
      'title': 'NIRCam',
      'description':
          'It has two major tasks, as an imager from 0.6 to 5 micron wavelength, and as a wavefront sensor to keep the 18-section mirrors functioning as one.\nIn other words, it is a camera and is also used to provide information to align the 18 segments of the primary mirror.\nNIRCam is also equipped with coronagraphs, which helps to collect data on exoplanets near stars.\nIt helps with imaging anything next to a much brighter object, because the coronagraph blocks that light.'
    },
    {
      'path': "assets/inst/nircam.jpg",
      'title': 'NIRCam',
      'description':
          'It has two major tasks, as an imager from 0.6 to 5 micron wavelength, and as a wavefront sensor to keep the 18-section mirrors functioning as one.\nIn other words, it is a camera and is also used to provide information to align the 18 segments of the primary mirror.\nNIRCam is also equipped with coronagraphs, which helps to collect data on exoplanets near stars.\nIt helps with imaging anything next to a much brighter object, because the coronagraph blocks that light.'
    },
    {
      'path': "assets/inst/nirspec.jpg",
      'title': 'NIRSpec',
      'description':
          'The NIRSpec instrument is a multi-object spectrograph and is capable of simultaneously measuring the near-infrared spectrum of up to 100 objects like stars or galaxies with low, medium and high spectral resolutions.\nThe observations are performed in a 3 arcmin × 3 arcmin field of view over the wavelength range from 0.6 µm to 5.0 µm.\nThe NIRSpec instrument operates at −235 °C and is passively cooled by cold space radiators which are mounted on the JWST Integrated Science Instrument Module (ISIM).\nThe radiators are connected to NIRSpec using thermally conductive heat straps.'
    },
    {
      'path': "assets/inst/nirspec.jpg",
      'title': 'NIRSpec',
      'description':
          'The NIRSpec instrument is a multi-object spectrograph and is capable of simultaneously measuring the near-infrared spectrum of up to 100 objects like stars or galaxies with low, medium and high spectral resolutions.\nThe observations are performed in a 3 arcmin × 3 arcmin field of view over the wavelength range from 0.6 µm to 5.0 µm.\nThe NIRSpec instrument operates at −235 °C and is passively cooled by cold space radiators which are mounted on the JWST Integrated Science Instrument Module (ISIM).\nThe radiators are connected to NIRSpec using thermally conductive heat straps.'
    },
    {
      'path': "assets/inst/Spectrometer.png",
      'title': 'Optical Spectrometer',
      'description':
          'It is an instrument used to measure properties of light over a specific portion of the electromagnetic spectrum, typically used in spectroscopic analysis to identify materials.\nThe variable measured is most often the light\'s intensity but could also, for instance, be the polarization state.\nA spectrometer is used in spectroscopy for producing spectral lines and measuring their wavelengths and intensities.\nSpectrometers may operate over a wide range of non-optical wavelengths, from gamma rays and X-rays into the far infrared.\nIf the instrument is designed to measure the spectrum on an absolute scale rather than a relative one, then it is typically called a spectrophotometer.\nThe majority of spectrophotometers are used in spectral regions near the visible spectrum.\nThey are used in astronomy to analyze the radiation from objects and deduce their chemical composition.\nThe spectrometer uses a prism or a grating to spread the light into a spectrum.\nThis allows astronomers to detect many of the chemical elements by their characteristic spectral lines.'
    },
    {
      'path': "assets/inst/Spectrometer.png",
      'title': 'Optical Spectrometer',
      'description':
          'It is an instrument used to measure properties of light over a specific portion of the electromagnetic spectrum, typically used in spectroscopic analysis to identify materials.\nThe variable measured is most often the light\'s intensity but could also, for instance, be the polarization state.\nA spectrometer is used in spectroscopy for producing spectral lines and measuring their wavelengths and intensities.\nSpectrometers may operate over a wide range of non-optical wavelengths, from gamma rays and X-rays into the far infrared.\nIf the instrument is designed to measure the spectrum on an absolute scale rather than a relative one, then it is typically called a spectrophotometer.\nThe majority of spectrophotometers are used in spectral regions near the visible spectrum.\nThey are used in astronomy to analyze the radiation from objects and deduce their chemical composition.\nThe spectrometer uses a prism or a grating to spread the light into a spectrum.\nThis allows astronomers to detect many of the chemical elements by their characteristic spectral lines.'
    },
  ];

  List<Map<String, dynamic>> cards_list = [];

  List<Map<int, Map<String, dynamic>>> matchCheck = [];

  //methods
  void initGame(cardCount, cards) {
    cards_list = cards..shuffle();
    gameColors = List.generate(cardCount, (index) => hiddenCard);
    gameImg = List.generate(
        cardCount,
        (index) => {
              'path': hiddenCardpath,
              'title': 'title',
              'description': 'description'
            });
  }
}
