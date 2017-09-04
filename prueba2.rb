
puts 'Bienvenido al Archivo de Notas de Alumnos'

option = 0

while option != 4 
  puts "\n"
  puts '1. Ingresar datos de una persona'
  puts '2. Editar datos de una persona'
  puts '3. Eliminar una persona'
  puts '4. Salir'
  
  option = gets.chomp.to_i

  case option 
    when 1
      

    when 2
      

    when 3
      
		
    when 4
      puts 'Adios!'
    
    else
      puts 'Opción inválida, ingrese una opción correcta'
    end
end
