import 'package:flutter/material.dart';

const List<String> LANGS = [
  'English',
  'Hindi',
];

// -------------------------- MOCK DATA ------------------ //
const List<Map<String, dynamic>> PESTICIDES = [
  {
    'uri': 'https://drive.google.com/uc?id=1xUi0fiCijvNSSpWQUJQ-aj3Y50V2rLhf',
    'description':
        'lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur',
    'id': 1,
    'name': 'Killer X',
    'price': 260.0,
    'unit': 'piece'
  },
  {
    'uri': 'https://drive.google.com/uc?id=1s554OBGcnSh0fH8MmhvT5tTUEr0-5TVG',
    'description':
        'lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur',
    'id': 2,
    'price': 630.49,
    'name': 'Shakti 23',
    'unit': 'piece'
  },
  {
    'uri': 'https://drive.google.com/uc?id=1kuHR1GchZwPoEfu8MgSaZyzVhKEKZujg',
    'description':
        'lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur',
    'id': 3,
    'price': 330.0,
    'name': 'Cure All',
    'unit': 'piece'
  },
];

const List<Map<String, dynamic>> FARM_PRODUCTS = [
  {
    'uri': 'https://drive.google.com/uc?id=1SpuDAB2stKvxnmNa9ZiAbSkG9KvZOovv',
    'description':
        'lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur',
    'id': 4,
    'price': 330.0,
    'name': 'Soyabean',
    'unit': 'kg'
  },
  {
    'uri': 'https://drive.google.com/uc?id=18AReRxsrEOwfuFYzx5M0B2DiXPzp6RD6',
    'description':
        'lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur',
    'id': 5,
    'price': 390.0,
    'name': 'Corn',
    'unit': 'kg'
  },
  {
    'uri': 'https://drive.google.com/uc?id=1Fdoypm9SA-itllwMGdmsMKViv5DNJLJq',
    'description':
        'lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur',
    'id': 6,
    'price': 200.0,
    'name': 'Arhar Dal',
    'unit': 'kg'
  }
];

const List<Map<String, dynamic>> FARM_MACHINES = [
  {
    'uri': 'https://drive.google.com/uc?id=1heSR1Uj8uM6Bl0_sBXdspMtrikZM_Nza',
    'description':
        'lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur',
    'id': 7,
    'price': 30.0,
    'name': 'Jute Sack',
    'unit': 'unit'
  },
  {
    'uri': 'https://drive.google.com/uc?id=1m_Uhkn6l-etqXxmluu_0LP-u8Co4449f',
    'description':
        'lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur',
    'id': 8,
    'price': 3490.0,
    'name': 'Pesticide sprayer',
    'unit': 'unit'
  },
  {
    'uri': 'https://drive.google.com/uc?id=1VkeCPMzJRlfnOflf39nqUPdjsew06DEX',
    'description':
        'lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur lorem ipsum doloe set amet cur',
    'id': 9,
    'price': 33440.0,
    'name': 'Electric pesticide sprayer',
    'unit': 'unit'
  }
];
const List<Map<String, dynamic>> SLOGANS = [
  {
    'uri': 'assets/images/logo.png',
    'title': {
      'English': 'Providing Modern Retail Experience To Indian Farmers',
      'Hindi': '',
    },
  },
  {
    'uri': 'assets/images/logo.png',
    'title': {
      'English': 'Forum: Learn from Agri Experts',
      'Hindi': '',
    },
  },
  {
    'uri': 'assets/images/logo.png',
    'title': {
      'English': 'Connecting Bharat with Digital India',
      'Hindi': '',
    }
  }
];

//-------------PRODUCT STRUCTURE-------------//

var PRODUCT_STRUCTURE = {
  'uri': '',
  'id': '',
  'title': {'English': '', 'Hindi': ''},
  'description': {'English': '', 'Hindi': ''},
  'price': '',
  'stock': '',
  'soldBy': {'English': '', 'Hindi': ''},
  //etc
};

//-------------------------------------------//

const List<Map<String, dynamic>> TOPCONTAINER = [
  {
    'uri': 'assets/images/logo.png',
    'title': {
      'English': 'Gardening',
      'Hindi': 'बागवानी',
    },
  },
  {
    'uri': 'assets/images/logo.png',
    'title': {
      'English': 'Bio Fertilisers',
      'Hindi': 'जैव उर्वरक',
    }
  },
  {
    'uri': 'assets/images/logo.png',
    'title': {
      'English': 'Water Soluble Fertilisers',
      'Hindi': '',
    }
  },
  {
    'uri': 'assets/images/logo.png',
    'title': {
      'English': 'Speciality Fertilisers',
      'Hindi': '',
    }
  },
  {
    'uri': 'assets/images/logo.png',
    'title': {
      'English': 'Growth Promoters',
      'Hindi': '',
    }
  },
  {
    'uri': 'assets/images/logo.png',
    'title': {
      'English': 'Seeds',
      'Hindi': '',
    }
  },
  {
    'uri': 'assets/images/logo.png',
    'title': {
      'English': 'Insecticide',
      'Hindi': '',
    }
  },
  {
    'uri': 'assets/images/logo.png',
    'title': {
      'English': 'Herbicide',
      'Hindi': '',
    }
  },
  {
    'uri': 'assets/images/logo.png',
    'title': {
      'English': 'Fungicide',
      'Hindi': '',
    }
  },
];

const List<Map<String, dynamic>> DETAILS = [
  {
    'title': {
      'English': 'Benefits',
      'Hindi': '',
    },
    'content': [
      'Ready to use soil mix',
      'Provides all essential nutrients in balance',
      'Customized Blend suitable for all products.',
      'Improves Nutrient Efficiency',
    ],
  },
  {
    'title': {
      'English': 'How to Use',
      'Hindi': '',
    },
    'content': [
      'Fill 3/4 Pot with Magic Soil, and re-pot your plants.',
      'Fill balance pot with Magic Soil and moisten mixture.',
      'Use 5Kg of Magic Soil per 12” dia pot, or Cover 5 Sq.Ft with ½ inch depth',
      'Be careful to not disturb the roots structure while transplanting.',
    ],
  },
  {
    'title': {
      'English': 'Precautions',
      'Hindi': '',
    },
    'content': [
      'Close Packet after every use.',
      'Keep in a cool and dry place.',
      'Keep out of reach of children.',
    ],
  },
];
