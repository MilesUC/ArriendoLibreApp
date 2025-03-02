# frozen_string_literal: true

class Reserva < ApplicationRecord
  validates :descripcion, :fecha_inicio, :fecha_termino, presence: true
  belongs_to :usuario
  validate :valid_dates

  def valid_dates
    if fecha_inicio >= fecha_termino
      errors.add :fecha_inicio, ' debe ser antes de la fecha término'
    elsif fecha_inicio < DateTime.now
      errors.add :fecha_inicio, ' debe ser válida'
    end
  end
  has_many :carro_items, dependent: :destroy
  has_many :productos, through: :carro_items
end
