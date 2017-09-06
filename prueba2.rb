def create_average
  file = File.open('alumnos.csv', 'r').readlines.each(&:chomp)
  students = []
  file.each { |line| students.push(line.split(', ').map(&:chomp)) }
  students_name = []
  students.each { |e| students_name.push(e[0]) }

  total_grades = []
  students.each do |e|
    e.shift
    suma = get_sum(e)
    total_grades.push(suma)
  end

  average_students = []
  i = 0
  students_name.each do |e|
    array = []
    array.push(e)
    array.push(total_grades[i].to_f / students[i].length.to_f)
    average_students.push(array)
    i += 1
  end

  file2 = File.open('students_average.csv', 'w')
  average_students.each { |e| file2.puts "#{e[0]}, #{e[1]}" }
  file2.close

  puts 'Se ha creado archivo students_average.csv con los promedios de cada alumno'
end

def get_sum(grades)
  sum = 0
  grades.each { |e| sum += e.to_i unless e == 'A' }
  return sum
end

def non_attendance
  file = File.open('alumnos.csv', 'r').readlines.each(&:chomp)
  students = []
  file.each { |line| students.push(line.split(', ').map(&:chomp)) }
  puts "\n"
  students.each { |e| puts "#{e[0]} tiene #{count_a(e)} inasistencias" }
end

def count_a(grades)
  sum = 0
  grades.each { |e| sum += 1 if e == 'A' }
  return sum
end

def approval_students(grade = 5)
  file = File.open('students_average.csv', 'r').readlines.each(&:chomp)
  students = []
  file.each { |line| students.push(line.split(', ').map(&:chomp)) }
  puts "\n"
  students.each { |average| puts "#{average[0]} ha aprobado el curso" if average[1].to_f >= grade }
end

puts "\n"
puts 'Bienvenido al Archivo de Notas de Alumnos'
puts '(seleccione una opción)'

option = 0

while option != 4
  puts "\n"
  puts '1. Generar archivo de alumnos con sus promedios'
  puts '2. Mostrar listado de inasistencias'
  puts '3. Ver alumnos aprobados'
  puts '4. Salir'
  option = gets.chomp.to_f

  case option
  when 1
    create_average

  when 2
    non_attendance

  when 3
    puts "\n"
    puts 'Ingrese nota de aprobación (si presiona entrar es 5)'
    grade = gets.chomp.to_f
    if grade.zero?
      approval_students
    else
      approval_students(grade)
    end

  when 4
    puts 'Adios!'
  else
    puts 'Opción inválida, ingrese una opción correcta'
  end
end
