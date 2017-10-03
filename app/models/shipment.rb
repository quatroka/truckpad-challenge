class Shipment < ApplicationRecord
  has_many :shipment_vehicles

  enum type: {
    'Bi-Truck' => 0,
    'Bitrem' => 1,
    'Bitrenzão (9 Eixos)' => 2,
    'Carreta LS Trucada' => 3,
    'Carreta Toco' => 4,
    'Rodotrem' => 5,
    'Só Cavalo Mecânico (4x2)' => 6,
    'Só Cavalo Mecânico LS' => 7,
    'Toco' => 8,
    'Toco 3/4' => 9,
    'Tritrem' => 10,
    'Truck' => 11,
    'Utilitário' => 12,
    'Van' => 13,
    'VUC / HR' => 14
  }

  enum body_type: {
    'Aberto / Grade Baixa' => 0,
    'Apenas Cavalo' => 1,
    'Baú' => 2,
    'Boiadeiro' => 3,
    'Bug / Porta Container' => 4,
    'Caçamba / Basculante Lateral' => 5,
    'Caçamba / Basculante Traseiro' => 6,
    'Canavieira' => 7,
    'Cegonha' => 8,
    'Florestal' => 9,
    'Frigorífico' => 10,
    'Gaiola' => 11,
    'Graneleiro / Grade Alta' => 12,
    'Munck' => 13,
    'Plataforma' => 14,
    'Prancha' => 15,
    'Refrigerado' => 16,
    'Sider' => 17,
    'Silo' => 18,
    'Tanque' => 19
  }
end
