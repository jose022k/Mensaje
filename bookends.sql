-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-06-2024 a las 20:36:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bookends`
--
CREATE DATABASE IF NOT EXISTS `bookends` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bookends`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `id` int(11) NOT NULL,
  `cantidad_libro` int(11) NOT NULL,
  `titulo_libro` varchar(255) NOT NULL,
  `duracion` varchar(255) DEFAULT NULL,
  `costo_libro` varchar(150) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `biografía` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id`, `nombre`, `nacionalidad`, `biografía`) VALUES
(1, 'Jane Austen', 'Británica', 'Nació el 16 de diciembre de 1775 en Steventon, Hampshire, Inglaterra, era la séptima hija del reverendo George Austen y Cassandra Austen. Desde joven, demostró una gran pasión por la lectura y la escritura, comenzó a escribir historias y poemas a temprana edad y su obra más temprana se compila en \"Juvenilia\", que fue una colección de escritos de su adolescencia. En su carrera literaria publicó su primera novela, \"Orgullo y prejuicio\", en 1813 bajo el seudónimo \"A Lady\". Seguida de cinco novelas más que son: \"Sensatez y sentimiento\" (1811), \"Mansfield Park\" (1814), \"Emma\" (1816), \"Persuasión\" (1818) y \"La abadía de Northanger\" (1818, publicada póstumamente). Sus novelas se caracterizan por su ingenio, su humor social y su perspicaz retrato de la vida de la clase alta inglesa de la época. Posteriormente falleció el 18 de julio de 1817 en Winchester, Inglaterra, a la edad de 41 años.'),
(2, 'Albert Camus', 'Francés', 'Nació el 7 de noviembre de 1913 en Mondovi (Argelia francesa, hoy Drean) Albert Camus creció en un ambiente humilde, marcado por la pobreza y la muerte de su padre en la Primera Guerra Mundial a pesar de las dificultades, se destacó en sus estudios y obtuvo una beca para estudiar filosofía en la Universidad de Argel. En su juventud comenzó su carrera literaria, se involucró en el teatro y comenzó a escribir ensayos y artículos periodísticos, fue entonces que en 1939 publicó su primera obra, Bodas, una colección de reflexiones sobre la vida y la muerte, su obra más conocida, El extranjero, se publicó en 1942 y lo consolidó como una figura importante del existencialismo. Cabe mencionar otras notables obras que incluyen La peste, El mito de Sísifo, La caída y El hombre rebelde. Llegado el año 1957 galardonado con el premio nobel de la literatura por su \"obra que pone de relieve los problemas que se plantean en la conciencia de los hombres de la actualidad\". Camus también tuvo un activismo político ya que en la segunda guerra mundial Camus se uniría la Resistencia francesa para luchar contra la ocupación alemana. Tras la guerra, se convirtió en un crítico vocal del colonialismo y la opresión, defendiendo los derechos de las minorías y la justicia social. Tiempo después Camus murió en un accidente automovilístico el 4 de enero de 1960 a la edad de 46 años.'),
(3, 'Charles Dickens', 'Británico', 'Charles John Huffam Dickens, conocido como Charles Dickens, nació el 7 de febrero de 1812 en Portsmouth, Inglaterra. Creció en el seno de una familia humilde y vivió en la pobreza durante su infancia, a los 12 años, se vio obligado a trabajar en una fábrica de betún para ayudar a su familia, esta experiencia lo marcó profundamente y lo inspiró a escribir sobre las condiciones de vida de los más pobres en sus obras. En su carrera literaria a pesar de las dificultades, Dickens logró educarse y comenzó a trabajar como periodista. En 1836, publicó su primera novela por entregas, Los papeles de Boz, que lo catapultó a la fama, su obra más conocida, Oliver Twist, se publicó en 1838 y lo consolidó como uno de los novelistas más populares de su época. A lo largo de su carrera, escribió 15 novelas, además de cuentos, artículos y ensayos. Entre sus obras más famosas se encuentran, David Copperfield, Grandes esperanzas, Tiempos difíciles y Cuento de Navidad. Las obras de Dickens exploran temas sociales como la pobreza, la desigualdad, la injusticia y la corrupción. También son conocidas por su humor, sátira y personajes memorables. Falleció el 9 de junio de 1870 en Gads Hill Place, Inglaterra, a la edad de 58 años.'),
(4, 'Miguel Cervantes', 'Español', 'Miguel de Cervantes nació el 29 de septiembre de 1547 en Alcalá de Henares, España. Miguel de Cervantes se mudaba mucho por el trabajo de su padre (Rodrigo de Cervantes) exponiendo a Miguel a diversas culturas. En 1571 se alista en la Armada Española y participa en la batalla de Lepanto, donde pierde el uso de su mano izquierda y en 1575 fue capturado por piratas berberiscos, pasa cinco años cautivo en Argel. De regreso a España tras su liberación, comienza a escribir obras de teatro, poesía y novelas. Su obra más famosa Don Quijote de la Mancha, considerada una obra maestra de la literatura universal, también escribió otras obras que vale la pena mencionar las novelas como La Galatea y Novelas ejemplares, poesía y teatro. El estilo de sus obras se caracteriza por el humor, la ironía y el realismo, posteriormente falleció el 22 de abril de 1616 en Madrid, España.'),
(5, 'Oscar Wilde', 'Irlandes', 'Nació el 16 de octubre de 1854 en Dublín, Irlanda, hijo de Sir William Wilde, un destacado médico, y Jane Wilde, una poetisa conocida como \"Speranza\". Tuvo un hermano y una hermana. Fue educado en casa hasta los nueve años, Se trasladó a Oxford, donde ganó el prestigioso premio Newdigate por su poema \"Ravenna\" Se graduó con honores en 1878. Tras graduarse comienza su carrera literaria mudándose a Londres, donde se convirtió en una figura popular en los círculos sociales y artísticos, escribió varios poemas, obras de teatro, ensayos y una única novela, El retrato de Dorian Gray. Su obra se caracterizó por su ingenio, humor, sátira y uso del lenguaje donde exponía temas como la estética, la moral, la hipocresía social y el amor. En 1884, se casó con Constance Lloyd, con quien tuvo dos hijos y tiempo después a principio de la década de 1890, inició una relación con Lord Alfred Douglas, lo que lo llevó a un escandaloso juicio por sodomía y a dos años de trabajos forzados en la cárcel de Reading. Tras su liberación, se exilió en Francia, donde vivió en la pobreza y el aislamiento. Murió en París en 1900 a la edad de 46 años.'),
(6, 'Gabriel García Márquez', 'Colombiano', 'Gabriel García Márquez nace el (6 de marzo de 1927 en Aracataca, Colombia) Hijo de Gabriel Eligio García Márquez y Luisa Santiaga Márquez Barcha. En su juventud creció en Aracataca, un pueblo bananero de Colombia, donde fue marcado por las experiencias de su infancia, que luego se reflejarían en su obra, estudió derecho en la Universidad Nacional de Colombia en Bogotá, pero abandonó sus estudios para dedicarse al periodismo. Inició su carrera como periodista en Bogotá, donde escribió artículos y cuentos para varios periódicos, publico su primera novela, La hojarasca, en 1955. Su obra más famosa es Cien años de soledad, publicada en 1967, la cual lo catapultó a la fama internacional y lo convirtió en uno de los principales exponentes del realismo mágico. También escribió otras obras como El coronel no tiene quien le escriba, Crónica de una muerte anunciada, El amor en los tiempos del cólera y El general en su laberinto. También escribió cuentos, reportajes, artículos y memorias. Las obras de Gabriel García Márquez se caracterizaban por su realismo mágico, que combina elementos de la realidad con la fantasía y lo mítico. También es conocido por su uso del humor, la ironía y la sátira en el cual sus exploraban temas como la soledad, el amor, la muerte, la memoria, el poder y la violencia. Gano numerosopremios literarios como el premio nobel de Literatura en 1982. Falleció el 17 de abril de 2014 en la Ciudad de México, México.'),
(7, 'Antoine de Saint-Exupéry', 'Francés', 'Nace el 29 de junio de 1900 en Lyon, Francia. Hijo de aristócratas, el Conde Antoine de Saint Exupéry y Marie de Coquelle. Tuvo cinco hermanos. En su juventud curso estudios en prestigiosos colegios franceses ya a los 12 años, tuvo su primer contacto con la aviación durante una estancia en un internado. En 1921 se une a la Fuerza Aérea Francesa siguiendo la tradición familiar, sufrió dos accidentes que marcaría su vida y obra. En 1926, publica su primera novela corta, El aviador. Llegado el año 1943 publica en Nueva York El Principito, un cuento filosófico ilustrado que se convierte en un clásico mundial, llegado el año 1944 se une a la Fuerza Aérea Aliada en Argelia donde el 31 de marzo de 1944 Desaparece en una misión de reconocimiento sobre el Mediterráneo. Su cuerpo no fue encontrado hasta 2003.'),
(8, 'Ana Frank', 'Alemana', 'Ana Frank (Anne Marie Frank) fue una joven de origen judío que dejó un testimonio conmovedor en su famoso diario. Nació en Frankfurt, Alemania, en 1929, y durante la Segunda Guerra Mundial, su familia se trasladó a los Países Bajos para escapar de la persecución nazi. Desde 1942 hasta 1944, Ana y su familia vivieron ocultos en unas habitaciones traseras de un edificio de oficinas en Ámsterdam. Fueron descubiertos por la Gestapo y enviados a un campo de concentración, donde murieron. El Diario de Ana Frank es un relato conmovedor de ese tiempo de terror y persecuciones.'),
(9, 'Dante Alighieri', 'Italiana', 'Su fecha de nacimiento se presume que fue entre el 15 de marzo y el 9 de mayo de 1265 en Florencia, Italia. Recibió una buena educación, incluyendo estudios de gramática, retórica, filosofía y teología. Se involucró en la política florentina, uniéndose al partido güelfo blanco. En 1302 es desterrado de Florencia por los güelfos negros, iniciando un largo exilio. Durante su exilio comienza a escribir su obra maestra, la Divina Comedia, una epopeya poética que narra su viaje a través del Infierno, el Purgatorio y el Paraíso. En 1321 fallece en Rávena, Italia.'),
(10, 'Edgar Allan Poe', 'Estadounidense', 'Nació el 19 de enero de 1809 en Boston, Massachusetts, Estados Unidos, hijo de David Poe Jr., un actor, y Elizabeth Arnold Poe. Quedó huérfano a los tres años y parte de su infancia la pasó en diferentes hogares de acogida y con familiares en Virginia. Se alistó en el Ejército de los Estados Unidos en 1827, pero lo dejó después de dos años, y así comenzó su carrera literaria. Es conocido por sus cuentos de terror y misterio, como \"El gato negro\", \"El corazón delator\" y \"La caída de la casa Usher\". Después de muchos años, tras el fallecimiento de su esposa Virginia, Poe murió de tuberculosis en 1849 en Baltimore, a la edad de 40 años.'),
(11, 'Agatha Christie', 'Británica', 'Agatha Mary Clarissa Christie (15 de septiembre de 1890, Torquay, Devon - 12 de enero de 1976, Wallingford, Oxfordshire) fue una escritora británica. Hija de Frederick Alvah Miller, un secretario de la corte, y Clarisa Margaret Boehmer. Tuvo siete hermanos y en su juventud recibió una educación privada. Alcanzó la fama internacional con novelas como \"Asesinato en el Orient Express\", \"Muerte en el Nilo\" y \"Diez negritos\". Se divorció de Archibald Christie en 1930 tras descubrir su infidelidad y se casó con Max Mallowan en el mismo año. Continuó escribiendo prolíficamente hasta su fallecimiento en 1976.'),
(12, 'Paulo Coelho', 'Brasilero', 'Nació el 24 de agosto de 1947 en Río de Janeiro, Brasil, hijo de Pedro Queima Coelho de Souza, ingeniero, y Lygia Araripe, ama de casa. Estudió en un colegio jesuita y cursó derecho en la Universidad de Río de Janeiro, pero abandonó sus estudios para dedicarse al teatro y la escritura. Empezó a trabajar como periodista en varios periódicos y revistas brasileñas. En 1970 experimentó una epifanía espiritual durante un viaje en tren por España y en 1974 publicó su primera novela, \"El peregrino de Compostela\", basada en sus experiencias en el Camino de Santiago. En 1982 publicó \"El alquimista\", su obra más famosa.'),
(13, 'Ken Follett', 'Británica', 'Nació el 5 de junio de 1949 en Cardiff, Gales, Reino Unido, hijo de Martin Follett, un empleado de banca, y Lavinia Veenie Follett. Estudió en la escuela secundaria Cathedral School en Llandaff y luego en el University College de Londres, donde se graduó en filosofía. Trabajó como periodista para varios periódicos y revistas en Gales y Londres. Publicó su primera novela de suspenso, \"The Shakeout\", en 1972, y alcanzó la fama internacional con la publicación de \"Los pilares de la Tierra\" en 1989. Su estilo se caracteriza por tramas complejas y una mezcla de ficción histórica y suspense.'),
(14, 'Joanne Kathleen Rowling', 'Británica', 'Nació el 1 de julio de 1965 en Yate, Gloucestershire, Reino Unido, hija de Peter James Rowling, un ingeniero aeronáutico de Rolls-Royce, y Anne Volant, científica. Estudió en la escuela primaria St Michael\'s y luego en la escuela secundaria Wyedean School and Sixth Form Centre. Posteriormente, asistió a la Universidad de Exeter, donde se graduó en francés y estudios clásicos. En 1990, tras la muerte de su madre, viajó a Portugal como profesora de inglés. Ese mismo año, en un viaje de tren de Manchester a Londres, la idea de Harry Potter nació de forma repentina. En 1997 se publicó \"Harry Potter y la piedra filosofal\", la primera novela de la serie, bajo el seudónimo de J.K. Rowling. En los años de 1998 a 2007 publicó las seis novelas siguientes de la serie de Harry Potter, alcanzando un éxito mundial sin precedentes. Ganó numerosos premios literarios, incluyendo el Premio Hugo, el Premio Locus y el Premio British Book. Actualmente, con 58 años, sigue viva.'),
(15, 'John Ronald Reuel Tolkien', 'Británico', 'J.R.R. Tolkien, cuyo nombre completo es John Ronald Reuel Tolkien, fue un escritor, poeta, filólogo y profesor universitario de nacionalidad británica. Nació en Bloemfontein, que en aquel entonces formaba parte del Estado Libre de Orange y hoy es parte de Sudáfrica. Es mundialmente conocido por ser el autor de obras clásicas de la literatura fantástica como \"El Hobbit\" y \"El Señor de los Anillos\".'),
(16, 'Ernest Hemingway', 'Estadounidense', 'Ernest Hemingway, nacido el 21 de julio de 1899 en Oak Park, Illinois, fue un reconocido escritor y novelista estadounidense. Desde muy joven mostró su pasión por la literatura y la escritura, lo que lo llevó a convertirse en una de las figuras más influyentes de la literatura del Siglo XX. Su estilo sobrio y su vida de aventuras le trajeron la admiración de las generaciones posteriores. Hemingway escribió la mayor parte de su obra entre mediados de la década de 1920 y mediados de la década de 1950. Ganó el Premio Pulitzer en 1953 por \"El viejo y el mar\" y al año siguiente el Premio Nobel de Literatura por su obra completa. Publicó siete novelas, seis recopilaciones de cuentos, dos ensayos y una obra de teatro. Póstumamente se publicaron tres novelas, cuatro libros de cuentos y tres ensayos. Muchos de estos son considerados clásicos de la literatura de Estados Unidos. Hemingway fue criado en Oak Park, Illinois, y sus experiencias en la Primera Guerra Mundial sirvieron de base para su novela \"Adiós a las armas\" (1929).'),
(17, 'Víctor Hugo', 'Francesa', 'Victor Hugo, cuyo nombre completo es Victor Marie Hugo, nació el 26 de febrero de 1802 en Besanzón, Francia, y falleció el 22 de mayo de 1885 en París. Fue un poeta, dramaturgo y novelista romántico francés, considerado uno de los más importantes en lengua francesa. Su obra abarca una gran variedad de géneros y ámbitos, y es conocido por obras como \"Nuestra Señora de París\" (1831) y \"Los miserables\" (1862). Además de su contribución a la literatura, también fue un político e intelectual influyente en la historia de Francia durante el siglo XIX.'),
(18, 'William Shakespeare', 'Británico', 'William Shakespeare fue un dramaturgo, poeta y actor inglés. Nació en Stratford-upon-Avon, Reino de Inglaterra, y fue bautizado el 26 de abril de 1564 (según el calendario juliano, que corresponde al 6 de mayo en el calendario gregoriano). Su fallecimiento ocurrió el 23 de abril de 1616 (según el calendario juliano, que corresponde al 3 de mayo en el calendario gregoriano). Aunque su autenticidad no está confirmada, el Retrato Chandos, atribuido a John Taylor, es una de las imágenes más conocidas de Shakespeare. Cuatro siglos después de su nacimiento, sigue siendo uno de los nombres más significativos dentro de la literatura universal y el escritor más importante de la lengua inglesa.'),
(19, 'Homero', 'Griego', 'Homero fue un poeta griego al que se atribuye la autoría de dos de los más grandes poemas épicos de la antigua Grecia: la Ilíada y la Odisea. Aunque su biografía está rodeada de misterio y leyendas, se cree que vivió alrededor del siglo VIII a.C. Sin embargo, su legado como poeta épico es innegable y sus obras continúan inspirando a generaciones de lectores y escritores.'),
(20, 'Stephen King', 'Estadounidense', 'Stephen Edwin King, más conocido como Stephen King, es un escritor estadounidense de novelas de terror, ficción sobrenatural, misterio, ciencia ficción y literatura fantástica. Nació el 21 de septiembre de 1947 en Portland, Maine, Estados Unidos. Sus libros han vendido más de 500 millones de ejemplares y la mayoría de ellos han sido adaptados al cine y la televisión. King ha publicado 65 novelas, once colecciones de relatos y novelas cortas, y siete libros de no ficción, además de un guion cinematográfico. Aunque ha sido criticado por algunos círculos literarios por ser considerado un autor “comercial”, su sentido de la narración, personajes animados y capacidad para jugar con los temores de los lectores han sido objeto de elogios. Además de utilizar el recurso del terror en varias de sus historias, también aborda temas como la infancia, el racismo y la guerra, brindando un retrato social muy realista de los Estados Unidos. Algunas de sus obras más conocidas incluyen “Carrie”, “El resplandor”, “It (Eso)”, “Misery” y \"La Torre Oscura\".'),
(21, 'Bram Stoker', 'Irlandés', 'Abraham “Bram” Stoker fue un novelista y escritor irlandés, conocido por su novela Drácula (1897). Nació el 8 de noviembre de 1847 en Clontarf, Irlanda, y falleció el 20 de abril de 1912 en Londres. A lo largo de su vida, Stoker también trabajó como funcionario, crítico de teatro y crítico de arte. Su obra más famosa, Drácula, ha dejado una huella duradera en la literatura de terror y la cultura popular.'),
(22, 'Max Brooks', 'Estadounidense', 'Max Brooks es un escritor, guionista y actor de voz estadounidense. Nació el 22 de mayo de 1972 en Nueva York, Estados Unidos. Es conocido por su novela “Guerra mundial Z: Una historia oral de la guerra zombi”, que tuvo una adaptación cinematográfica en 2013. Además, Max Brooks es hijo del director de cine Mel Brooks y de la fallecida actriz Anne Bancroft. A lo largo de su carrera, ha trabajado como guionista para programas de televisión como Saturday Night Live y también ha puesto su voz en series de dibujos animados.'),
(23, 'Aurelio Baldor', 'Cubana', 'Aurelio Ángel Baldor de la Vega nació en La Habana, Cuba, el 22 de octubre de 1906, y falleció el 2 de abril de 1978 en Miami, Estados Unidos. Fue un matemático, profesor, escritor y abogado cubano. Es especialmente conocido por su libro “Álgebra de Baldor”, publicado en 1941 y reeditado en numerosas ocasiones. Además de su famoso libro de álgebra, también escribió otros libros como “Aritmética de Baldor”, “Geometría plana y del espacio”, y \"Trigonometría de Baldor\". Su contribución a la enseñanza de las matemáticas ha dejado una huella duradera en la educación matemática en muchos países de habla hispana.'),
(24, 'Jaime Lopera', 'Colombiano', 'Jaime Lopera, nacido en Calarcá, Quindío, Colombia en 1936, es un escritor, ensayista, columnista de opinión, cuentista, historiador y periodista. Estudió Derecho en la Universidad Externado de Colombia y se especializó en comportamiento humano en el NTL/Institute For Applied Behavioral Sciences. Además de su carrera literaria, Lopera también ha sido consultor de empresas y ha colaborado con diversas publicaciones, como la revista Pluma y los diarios Portafolio y La Crónica del Quindío. Su producción literaria incluye cuentos, ensayos y parábolas del éxito, y ha sido un influyente gestor de procesos de cambio a lo largo de su carrera.'),
(25, 'Marta Bernal', 'Colombiana', 'Marta Inés Bernal Trujillo es una escritora y trabajadora social colombiana. Nació en Medellín y se especializó en Gerencia de Recursos Humanos. A lo largo de su trayectoria, ha trabajado para organizaciones como Unicef, Enka, Coltabaco, Concasa y Corporación Colmena. Además de su labor en el ámbito social, Marta Inés Bernal Trujillo es conocida por su colaboración con su esposo, Jaime Lopera, en la escritura de “La culpa es de la vaca”, un bestseller de autoayuda en el campo del liderazgo. Esta serie de libros ha vendido más de 500 mil ejemplares en los últimos diez años en Colombia, Ecuador y Venezuela.'),
(26, 'Stephen Covey', 'Estadounidense', 'Stephen Richards Covey nació el 24 de octubre de 1932 en Salt Lake City, Estados Unidos, y falleció el 16 de julio de 2012 en Idaho Falls, Estados Unidos. Fue licenciado en administración de empresas, escritor, conferenciante, religioso y profesor estadounidense, conocido por ser el autor del superventas \"Los siete hábitos de las personas altamente efectivas\". Además, Covey era padre y abuelo, con nueve hijos y cincuenta y dos nietos. Recibió el premio de Paternidad del National Fatherhood Initiative en el año 2003. Su legado sigue siendo relevante en el ámbito de la autoayuda y el liderazgo empresarial. Su hijo, Sean Covey, también es autor y conferenciante en el mismo campo.'),
(27, 'James Clear', 'Estadounidense', 'James Clear es un escritor y orador estadounidense. Nació y creció en Hamilton, Ohio. Su trabajo se centra en formar a la gente para que adquiera hábitos de larga duración, conocimiento que queda reflejado en su libro de autoayuda \"Hábitos atómicos\". Este best seller número 1 del New York Times ha vendido más de 10 millones de copias en todo el mundo y ha sido traducido a más de 20 idiomas. Además de su éxito literario, Clear ofrece un curso en línea llamado Habits Academy, donde recibe millones de visitas mensuales. También imparte conferencias en universidades y ejerce como consultor para diferentes empresas, además de ser orador de Fortune 500.'),
(28, 'Robin S. Sharma', 'Canadiense', 'Robin S. Sharma es un escritor y conferenciante motivacional canadiense. Nació el 16 de junio de 1964 en Port Hawkesbury, Canadá. Además de su nacionalidad canadiense, también tiene nacionalidad mauriciana. Su libro más famoso, \"El monje que vendió su Ferrari\", escrito en modo de fábula, ha sido publicado en muchos idiomas y países. Algunas de sus otras obras notables incluyen \"El Club de las 5 de la mañana\", \"El líder que no tenía cargo\" y \"8 Claves del liderazgo del monje\".'),
(29, 'Erich Fromm', 'Alemana', 'Erich Fromm nació el 23 de marzo de 1900 en Frankfurt, Alemania, en una familia de origen judío ortodoxo. A lo largo de su vida, se destacó como psicoanalista, psicólogo social y filósofo humanista. Su obra se centró principalmente en el estudio de la naturaleza humana desde la perspectiva de la psicología social. Además, Fromm apreciaba la crítica a la sociedad occidental y se interesaba por el proyecto humanista del “primer Marx” a partir de los Manuscritos económicos-filosóficos del año 1884. Algunas de sus obras más conocidas incluyen “El miedo a la libertad”, “El arte de amar” y \"Anatomía de la destructividad humana\".'),
(30, 'Sun Tzu', 'Chino', 'Sun Tzu fue un general, estratega militar y filósofo de la antigua China. Su nombre de nacimiento era Sun Wu, y fuera de su familia era conocido por su nombre de cortesía Changqing. Tradicionalmente se le considera como el autor de \"El arte de la guerra\", un influyente tratado sobre estrategia militar. Nació alrededor del año 544 a.C. y falleció aproximadamente en el 496 a.C. o 470 a.C. Aunque los historiadores han cuestionado si Sun Tzu fue una figura histórica auténtica, se le sitúa en el período de las primaveras y Otoños de China (722-481 a.C.) como general militar al servicio del rey Helü de Wu. Su obra, \"El arte de la guerra\", sigue siendo influyente en todo el mundo en ámbitos como la política, los negocios, los deportes y la guerra.'),
(31, 'Franz Kafka', 'Checa', 'Franz Kafka fue un escritor checo cuya obra, escrita en lengua alemana, está considerada como una de las más influyentes de la literatura del siglo XX. Nació el 3 de julio de 1883 en Praga, que en ese momento formaba parte del Reino de Bohemia dentro del Imperio austrohúngaro. A lo largo de su vida, Kafka escribió novelas, relatos cortos y correspondencia, y su estilo literario ha sido asociado con el existencialismo y el expresionismo. Algunas de sus obras más conocidas incluyen \"La metamorfosis\", \"El proceso\" y \"El castillo\". Aunque su nacionalidad cambió a checoslovaca después de la creación de Checoslovaquia en 1918, Kafka siempre escribió en alemán y su legado sigue siendo relevante en la literatura mundial.'),
(32, 'Virginia Woolf', 'Británica', 'Virginia Woolf (con apellido de nacimiento Stephen) nació el 25 de enero de 1882 en Kensington, Londres, Reino Unido, y falleció el 28 de marzo de 1941 cerca del Río Ouse, en Sussex Oriental, Reino Unido. Fue una escritora británica destacada, autora de novelas, cuentos, obras teatrales y otros trabajos literarios. Woolf es considerada una de las figuras más importantes del modernismo anglosajón del siglo XX y del feminismo internacional. Durante el período de entreguerras, fue una figura influyente en la sociedad literaria de Londres y miembro del grupo de Bloomsbury. Sus obras más famosas incluyen las novelas La señora Dalloway (1925), Al faro (1927), Orlando: una biografía (1928), Las olas (1931), y su breve ensayo Una habitación propia (1929), en el que afirmó: “Una mujer debe tener dinero y una habitación propia si va a escribir ficción”.'),
(33, 'Paula Hawkins', 'Británica', 'Paula Hawkins es una escritora británica nacida el 26 de agosto de 1972 en Salisbury, que en ese momento formaba parte de Rhodesia (actualmente Harare, Zimbabue). Aunque nació en África, se trasladó a Inglaterra en la década de los 80, donde creció y se crió. Hawkins es conocida por sus exitosas novelas de misterio y suspense, como “La chica del tren” y “Escrito en el agua”.'),
(34, 'Gillian Flynn', 'Estadounidense', 'Gillian Flynn es una escritora y periodista estadounidense. Nació el 24 de febrero de 1971 en Kansas City, Misuri. Es autora del superventas Perdida (Gone Girl, 2012) y del guion adaptado de su novela para el cine de título homónimo. Flynn también escribió otras novelas de intriga criminal, como Sharp Objects y Dark Places. Su trabajo se ha destacado por su enfoque en personajes complejos y tramas retorcidas.'),
(35, 'Dennis Lehane', 'Estadounidense', 'Dennis Lehane es un escritor estadounidense. Nació el 4 de agosto de 1965 en Dorchester, Boston, Massachusetts. Su ascendencia es irlandesa, y sus historias retratan la vida de grupos inmigrantes o marginados en Boston. Además, constituyen un retrato de la cultura irlandesa, resaltando el peso de la religión católica en varios de sus personajes.'),
(36, 'Herman Melville', 'Estadounidense', 'Herman Melville fue un escritor, novelista, poeta y ensayista estadounidense. Nació el 1 de agosto de 1819 en Nueva York y falleció el 28 de septiembre de 1891, también en Nueva York. Entre sus obras más conocidas se encuentra “Moby Dick”, considerada su obra maestra y un clásico de la literatura universal. Además, publicó relatos como “Bartleby, el escribiente” y la novela corta \"Benito Cereno\". A lo largo de su vida, Melville también incursionó en la poesía, y su novela “Billy Budd”, aunque quedó inconclusa, es considerada una de las obras más relevantes de la literatura estadounidense. Su legado literario sigue marcando la historia y su influencia perdura hasta hoy.'),
(37, 'Robert Louis Stevenson', 'Escocés', 'Robert Louis Stevenson fue un escritor escocés nacido el 13 de noviembre de 1850 en Edimburgo, Escocia. Es conocido por ser uno de los autores más destacados de la literatura del siglo XIX, especialmente por sus novelas de aventuras y de terror. Su legado incluye una vasta obra que abarca crónicas de viaje, colecciones de relatos y novelas históricas y de aventuras. Algunas de sus obras más famosas son La isla del tesoro, Secuestrado y El extraño caso del doctor Jekyll y el señor Hyde. A lo largo de su vida, Stevenson también escribió ensayos y poesía, dejando una huella significativa en la literatura británica y mundial.'),
(38, 'Fernando Savater', 'Español', 'Fernando Fernández-Savater Martín, nacido el 21 de junio de 1947 en San Sebastián, España, es un filósofo, profesor de Filosofía y escritor español. Destaca en el campo del ensayo y el artículo periodístico, y ha cultivado también la novela y el género dramático. Su labor de divulgación y crítica cultural lo convirtió en un referente para toda una generación en España. Algunos de sus títulos superventas incluyen “Ética para Amador” (1991) y “El contenido de la felicidad” (1986). Savater considera la filosofía como una actividad de crítica permanente, expresión de la subjetividad e incluso provocación, lo que traslada en sus obras mediante un estilo audaz y expresivo que utiliza el matiz, la ironía y la paradoja como estructuras de razonamiento. Además, ha recibido varios premios, como el Premio Ortega y Gasset (2000), el Premio Planeta (2008) y el Premio Anagrama (1982).'),
(39, 'Marco Aurelio ', 'Romano', 'Marco Aurelio (Marcus Annius Verus) fue un emperador y filósofo romano. Nació en Roma en el año 121. Pertenecía a una gens española de Roma y llamó la atención del emperador Adriano desde niño. Adriano quedó admirado por su ingenua franqueza e inteligencia, y ordenó a Antonino Pío que lo adoptara en el año 138, quedándole destinado el imperio. Su madre fue Domicia Lucilla, y era huérfano de padre, ejerciendo ese papel durante un tiempo su abuelo paterno, el prefecto Roma Annio Vero. Marco Aurelio estudió retórica griega y latina con Herodes Ático y Marco Cornelio Frontón, quien desde entonces habría de ser su amigo y consejero espiritual. Seducido por el estoicismo, vistió muy pronto el manto de filósofo en el año 133. Durante su reinado, el imperio se vio sacudido por ataques de bárbaros, revueltas populares y epidemias, pero Marco Aurelio enfrentó estos desafíos con serenidad y fuerza moral. A pesar de su temperamento pacífico y preocupación por la economía, tuvo que concertar empréstitos forzosos y desprenderse de parte del patrimonio imperial para hacer frente a la presión de los bárbaros.'),
(40, 'Platón', 'Griego', 'Platón, uno de los filósofos más influyentes de la historia, nació alrededor del año 427 a.C. en Atenas o en la isla de Egina. Fue hijo de Aristón y Perictione, pertenecientes a una familia aristocrática ateniense. Su legado filosófico ha perdurado a lo largo de los siglos, y sus obras, mayoritariamente en forma de diálogo, abarcan temas como filosofía política, ética, psicología, antropología filosófica, epistemología, gnoseología, metafísica, cosmogonía, filosofía del lenguaje y filosofía de la educación. Platón también fundó la Academia de Atenas en el año 387 a.C., una institución que continuaría durante más de novecientos años y a la que Aristóteles acudiría para estudiar filosofía. Su influencia en la filosofía occidental es innegable, y su legado sigue siendo objeto de estudio y debate en la actualidad.'),
(42, 'John McMurry', 'Estadounidense', 'John E. McMurry, nacido el 29 de julio de 1942 en Nueva York, es un renombrado químico orgánico y autor educativo. Con un Bachelor of Arts de Harvard y un doctorado de Columbia, McMurry ha sido reconocido como Fellow de la American Association for the Advancement of Science y de la Alfred P. Sloan Research Foundation. Ha recibido premios como el Career Development Award del NIH y el Max Planck Research Award. Es conocido por sus libros de texto sobre química orgánica, que han sido fundamentales para la formación de más de un millón de estudiantes a nivel mundial, destacando por su claridad y accesibilidad en la enseñanza de esta compleja disciplina.'),
(43, 'Isabel Allende', 'Chilena', 'Isabel Allende es una escritora con nacionalidad chilena. Nació en Lima, Perú, el 2 de agosto de 1942, y es conocida por ser una de las autoras más leídas del mundo de habla hispana. Desde 2004, es miembro de la Academia Estadounidense de las Artes y las Letras y ha recibido numerosos premios, incluyendo el Premio Nacional de Literatura de Chile en 2010.'),
(44, 'Laura Esquivel', 'Mexicana', 'Laura Esquivel es una escritora y política mexicana. Nació el 30 de septiembre de 1950 en la Ciudad de México. Es ampliamente reconocida por su novela \"Como agua para chocolate\", que fue publicada en 1989 y ha sido traducida a más de 30 idiomas. Además de su carrera literaria, desde 2015 es diputada federal por el Movimiento de Regeneración Nacional (Morena) en México.'),
(45, 'Jorge de Montemayor', 'Portugués', 'Nació en Montemor-o-Velho, Portugal, alrededor del año 1520 y falleció en la región del Piamonte, Italia, aproximadamente en 1561. Es conocido principalmente por su obra “Los siete libros de la Diana”, la primera novela pastoril en lengua castellana, que tuvo una gran influencia en la literatura del siglo XVI.'),
(46, 'Gaspar Gil Polo', 'Español', 'Gaspar Gil Polo fue un escritor y jurista español. Nació en Valencia, España, alrededor del año 1540 y falleció en Barcelona, España, aproximadamente en 1584. Es conocido principalmente por su obra “Diana enamorada”, que es una continuación de la “Diana” de Jorge de Montemayor. Además, su calidad literaria fue tan admirada que incluso Miguel de Cervantes Saavedra lo imitó.'),
(47, 'Jacopo Sannazaro', 'Italiano', 'Jacopo Sannazaro fue un escritor italiano del Renacimiento. Nació en Nápoles, que en aquel entonces formaba parte del Reino de Nápoles. Es conocido por escribir sus obras tanto en latín clásico como en vulgar, y es especialmente famoso por su obra maestra en lengua vulgar, la Arcadia.'),
(48, 'Jack Kerouac', 'Estadounidense', 'Jack Kerouac fue un novelista y poeta estadounidense de ascendencia franco-canadiense. Nació el 12 de marzo de 1922 en Lowell, Massachusetts, EE. UU., y creció en un hogar de habla francesa. Aunque Kerouac es ampliamente reconocido como una figura clave de la Generación Beat en la literatura estadounidense, sus raíces y su herencia cultural franco-canadiense jugaron un papel importante en su vida y obra.'),
(49, 'John Steinbeck', 'Estadounidense', 'John Steinbeck fue un escritor estadounidense. Nació el 27 de febrero de 1902 en Salinas, California, Estados Unidos, y falleció el 20 de diciembre de 1968 en Nueva York, Estados Unidos. Es conocido por sus obras como “De ratones y hombres”, “Las uvas de la ira”, “La perla” y “Al este del Edén”, y fue galardonado con el Premio Nobel de Literatura en 1962.'),
(50, 'Elizabeth Gilbert', 'Estadounidense', 'Elizabeth Gilbert, nacida el 18 de julio de 1969 en Waterbury, Connecticut, es una aclamada autora estadounidense conocida por su bestseller internacional “Eat, Pray, Love”. Creció en una granja de árboles de Navidad y se educó en la Universidad de Nueva York. Antes de su éxito literario, trabajó en diversos empleos, desde camarera hasta cocinera de campamento, lo que enriqueció su escritura con experiencias variadas. Su carrera despegó cuando “Esquire” publicó su cuento “Pilgrims” en 1993, y desde entonces ha escrito una colección de cuentos, novelas y obras de no ficción, incluyendo “The Last American Man”, finalista del National Book Award y del National Book Critics Circle Award. Además de “Eat, Pray, Love”, que fue adaptado al cine, Gilbert ha publicado “Committed” y “Big Magic”, explorando temas de amor y creatividad. Su novela “The Signature of All Things” recibió elogios por su narrativa vibrante y detallada. A través de su escritura, Gilbert continúa inspirando a lectores en todo el mundo.'),
(51, 'Apsley Cherry-Garrard', 'Estadounidense', 'Apsley Cherry-Garrard fue un destacado explorador polar inglés y autor, nacido el 2 de enero de 1886 en Bedford, Inglaterra. Educado en Winchester College y Christ Church, Oxford, Cherry-Garrard se unió a la expedición Terra Nova a la Antártida a los 24 años, siendo uno de los miembros más jóvenes. Su contribución más famosa fue su participación en la “peor travesía del mundo”, una misión invernal para recolectar huevos de pingüino emperador en condiciones extremas. Después de la expedición, escribió “The Worst Journey in the World” (1922), una crónica conmovedora y detallada de las experiencias del equipo, que se ha convertido en un clásico de la literatura de viajes. Cherry-Garrard vivió una vida marcada por los desafíos físicos y mentales derivados de sus aventuras polares, falleciendo el 18 de mayo de 1959 en Londres. Su legado perdura como un testimonio de la resistencia humana y la exploración científica.'),
(52, 'Immanuel Kant', 'Ruso', 'Immanuel Kant, a quien probablemente te refieres, fue un filósofo de la Ilustración nacido en Königsberg, Prusia (actual Kaliningrado, Rusia) el 22 de abril de 1724 y falleció en la misma ciudad el 12 de febrero de 1804. Durante su vida, Kant fue considerado prusiano, ya que Königsberg era parte de Prusia en ese momento. Es conocido por ser el primero y más importante representante del criticismo y precursor del idealismo alemán.'),
(53, 'Friedrich Nietzsche', 'Suizo', 'Nació el 15 de octubre de 1844 en Röcken, región de Turingia, que pertenecía al reino de Sajonia y fue anexionada en 1815 a Prusia. Nietzsche es conocido por sus obras filosóficas, como “Así habló Zaratustra” y “Más allá del bien y del mal”. Su pensamiento influyó profundamente en la filosofía occidental y en la crítica de la moralidad y la religión. Aunque nació en Alemania, pasó gran parte de su vida en Suiza, donde murió el 25 de agosto de 1900 en Weimar. Su legado sigue siendo relevante en la actualidad, y su obra continúa siendo objeto de estudio y debate en el ámbito filosófico.'),
(54, 'René Goscinny', 'Francés', 'René Goscinny, conocido por ser el guionista de las historietas de Astérix, nació en París, Francia, el 14 de agosto de 1926. Aunque a los dos años se trasladó con su familia a Argentina, y más tarde vivió en Nueva York y Bruselas, su nacionalidad es francesa. Es uno de los escritores más destacados en el mundo del cómic, y junto con Albert Uderzo, creó uno de los personajes más icónicos de la historia del cómic europeo: Astérix el Galo.'),
(55, 'Shirley Jackson', 'Estadounidense', 'Shirley Jackson fue una destacada novelista y cuentista estadounidense, conocida por su especialización en el género de terror. Nació en San Francisco, California, el 14 de diciembre de 1916, y falleció en North Bennington, Vermont, el 8 de agosto de 1965. Su obra ha tenido una gran influencia en autores contemporáneos y es recordada por relatos como “La lotería” y novelas como “La maldición de Hill House”.'),
(56, 'Antón Chéjov', 'Ruso', 'Antón Chéjov fue un cuentista, dramaturgo y médico ruso. Nació en Taganrog, que en aquel entonces formaba parte del Imperio ruso, el 29 de enero de 1860 y falleció en Badenweiler, Imperio alemán, el 15 de julio de 1904. Es considerado uno de los más importantes autores de relato corto en la historia de la literatura y un maestro del realismo literario.'),
(57, 'Marcel Mauss', 'Francés', 'Marcel Mauss fue un destacado antropólogo y sociólogo francés. Nació en Épinal, Francia, el 10 de mayo de 1872 y falleció en París, Francia, el 10 de febrero de 1950. Es considerado uno de los ‘padres de la etnología francesa’ y es conocido por su influyente obra “Ensayo sobre el don”, entre otros importantes trabajos en el campo de la antropología y la sociología.'),
(58, 'Charles Perrault', 'Francés', 'Charles Perrault fue un escritor de nacionalidad francesa. Nació en París, Francia, el 12 de enero de 1628 y falleció en la misma ciudad el 16 de mayo de 1703. Es ampliamente reconocido por haber dado forma literaria a cuentos clásicos infantiles como Piel de asno, Pulgarcito, Barba Azul, La Cenicienta, La bella durmiente, Caperucita Roja y El Gato con Botas.'),
(59, 'Jacob Grimm', 'Alemán', 'Jacob Grimm fue un célebre lingüista, filólogo y mitólogo de nacionalidad alemana. Nació el 4 de enero de 1785 en Hanau, que en aquel entonces formaba parte del landgraviato de Hesse-Kassel, Sacro Imperio Romano Germánico, y falleció el 20 de septiembre de 1863 en Berlín, en el Reino de Prusia, Confederación Germánica. Es ampliamente reconocido por su trabajo junto a su hermano menor, Wilhelm Grimm, con quien recopiló cuentos folclóricos alemanes, conocidos como los Cuentos de la infancia y del hogar.'),
(60, 'Hans Christian Andersen', 'Danés', 'Hans Christian Andersen fue un escritor y poeta de nacionalidad danesa. Nació en Odense, Dinamarca, el 2 de abril de 1805 y falleció en Copenhague, Dinamarca, el 4 de agosto de 1875. Es mundialmente conocido por sus cuentos para niños, como “El patito feo” y “La sirenita”.'),
(61, 'Gabrielle-Suzanne Barbot de Villeneuve', 'Francesa', 'Gabrielle-Suzanne Barbot de Villeneuve fue una escritora francesa del siglo XVIII. Es especialmente conocida por su versión original del cuento de hadas “La Bella y la Bestia”, publicada en 1740. Nació y murió en París, y pertenecía a una poderosa familia protestante de La Rochelle.'),
(62, 'Daniel Defoe', 'Británico', 'Daniel Defoe, cuyo nombre de nacimiento era Daniel Foe, era británico. Nació en Londres, Reino Unido, alrededor del 10 de octubre de 1660, y falleció en la misma ciudad el 24 de abril de 1731. Es mundialmente conocido por su novela Robinson Crusoe y es considerado uno de los pioneros del género novelístico, así como el padre de todos los novelistas ingleses.'),
(63, 'Jonathan Swift', 'Irlandés', 'Jonathan Swift fue un escritor satírico irlandés. Nació en Dublín, Irlanda, el 30 de noviembre de 1667 y falleció en la misma ciudad el 19 de octubre de 1745. Es conocido principalmente por su obra “Los viajes de Gulliver”, una crítica mordaz de la sociedad humana.'),
(64, 'Julio Verne', 'Francés', 'Julio Verne, cuyo nombre completo es Jules Gabriel Verne, fue un escritor francés. Nació el 8 de febrero de 1828 en Nantes, Francia, y es ampliamente reconocido por sus novelas de aventuras y por su influencia en el género literario de la ciencia ficción.'),
(65, 'Mark Twain (Samuel Langhorne Clemens)', 'Estadounidense', 'Conocido por su seudónimo Mark Twain, fue un escritor, orador y humorista estadounidense. Nació el 30 de noviembre de 1835 en Florida, Missouri, y falleció el 21 de abril de 1910 en Redding, Connecticut. Pasó su infancia en Hannibal, Missouri, donde se inspiró para sus obras más famosas como \"Las aventuras de Tom Sawyer\" y \"Las aventuras de Huckleberry Finn\". Adoptó el seudónimo \"Mark Twain\" en 1863. En 1876, publicó su primera novela, \"Las aventuras de Tom Sawyer\". Su obra más famosa, \"Las aventuras de Huckleberry Finn\", se publicó en 1885 y es considerada una obra maestra de la literatura estadounidense.'),
(66, ' Horace Walpole', 'Británico', 'Horace Walpole, IV conde de Orford, conocido comúnmente como Horace Walpole, fue un escritor, político, historiador del arte y arquitecto inglés. Nació el 24 de septiembre de 1717 en Londres y falleció el 2 de marzo de 1797 en Berkeley Square, Reino Unido. Era hijo del primer ministro Robert Walpole y Catherine Shorter. Es conocido principalmente por su novela gótica \"El castillo de Otranto\" (1764), considerada una obra pionera del género. También escribió una gran cantidad de cartas, ensayos y obras de historia del arte, incluyendo \"Anécdotas de la pintura en Inglaterra\" (1762-1771).'),
(67, 'Matthew Gregory Lewis', 'Británico', 'Matthew Gregory Lewis, conocido como Monk Lewis a raíz de su primera obra, fue un escritor, dramaturgo y político británico nacido el 9 de julio de 1775 en Londres y fallecido el 14 de mayo de 1818 en Monterrey, Jamaica. Era hijo de un diplomático con varias plantaciones en Jamaica y cursó sus primeras letras en la Westminster School. Desde temprana edad mostró interés por la literatura y el teatro, influenciado por las obras de autores como William Shakespeare y Horace Walpole. Viajó por Europa durante su juventud, visitando Francia, Alemania y Holanda, donde conoció a importantes figuras del movimiento romántico. En su carrera literaria, su obra más famosa es la novela gótica \"El monje\" (1796), que narra la historia de Ambrosio, un monje que sucumbe a la tentación y al mal. La novela fue un gran éxito en su época y contribuyó a popularizar el género gótico en la literatura inglesa. Lewis escribió otras novelas, obras de teatro y poemas. Entre sus obras más destacadas se encuentran \"El espectro del castillo\" (1796), \"Cuentos de terror\" (1799) y \"Cuentos maravillosos\" (1801). Su estilo literario se caracterizó por su uso de elementos góticos como el misterio, el horror y la sobrenaturalidad. También explora temas como la religión, la moral y la naturaleza humana.'),
(68, 'Mary Shelley', 'Británica', 'Mary Wollstonecraft Shelley, conocida principalmente por su nombre de casada, fue una escritora, dramaturga, ensayista y biógrafa británica nacida el 30 de agosto de 1797 en Londres, Inglaterra, y fallecida el 1 de febrero de 1851 en Chester Square, Londres. Hija de la filósofa y escritora feminista Mary Wollstonecraft y del filósofo, novelista y periodista William Godwin. Pasó su infancia rodeada de intelectuales y artistas, y desde temprana edad mostró interés por la literatura y la escritura. En su carrera literaria, su obra más famosa es la novela gótica \"Frankenstein o el moderno Prometeo\" (1818), considerada la primera novela de ciencia ficción moderna y que inaugura el género. Además de \"Frankenstein\", Shelley escribió otras novelas, cuentos, ensayos y biografías. Entre sus obras más destacadas se encuentran \"Matilda\" (1819), \"Valperga\" (1823), \"El último hombre\" (1826) y \"Perkin Warbeck\" (1834). Su estilo literario se caracteriza por su exploración de temas como la naturaleza humana, la responsabilidad científica, la moralidad y la condición femenina.'),
(69, 'Daphne Du Maurier', 'Británico', 'Daphne du Maurier fue una novelista, cuentista y dramaturga británica nacida el 13 de mayo de 1907 en Londres y fallecida el 19 de abril de 1989 en Fowey, Cornualles, Inglaterra. Es conocida por sus novelas góticas y románticas, muchas de las cuales han sido adaptadas a películas y series de televisión. Nació en el seno de una familia acomodada de artistas. Su padre, Sir Gerald du Maurier, era un actor y gerente de teatro, y su madre, Muriel Beaumont, era una actriz. Pasó su infancia en Londres y en Cornualles, donde se enamoró del paisaje y la cultura local. A inicios de su carrera literaria, publicó su primera novela, \"Jamaica Inn\", en 1936. La novela, ambientada en la costa de Cornualles, fue un éxito inmediato y la estableció como una autora popular. Justo después vino su obra más famosa, la novela \"Rebeca\" (1938), una historia de amor y suspenso ambientada en una mansión inglesa. La novela fue un éxito de ventas y crítica, y fue adaptada a una película ganadora de un Oscar por Alfred Hitchcock en 1940. Su estilo literario se caracteriza por su atmósfera gótica, sus personajes complejos y sus tramas intrigantes. A menudo explora temas como el amor, la pérdida, la traición y la locura.'),
(70, 'Frank Herbert', 'Estadounidense', 'Franklin Patrick Herbert Jr., conocido como Frank Herbert, fue un escritor estadounidense de ciencia ficción nacido el 8 de octubre de 1920 en Tacoma, Washington, y fallecido el 11 de febrero de 1986 en Madison, Wisconsin. Es famoso por su novela de 1965 \"Dune\" y sus cinco secuelas, que conforman una de las obras de ciencia ficción más aclamadas y complejas del género. Creció en una familia humilde y tuvo una infancia marcada por la Gran Depresión. Desde temprana edad mostró interés por la ciencia, la naturaleza y la escritura. Herbert sirvió en la Marina de los Estados Unidos durante la Segunda Guerra Mundial, donde desarrolló una fascinación por los desiertos y la ecología. Comenzó a escribir a finales de la década de 1940, publicando cuentos en revistas de ciencia ficción. Su primera novela, \"El planeta Dune\" (más tarde retitulada \"Dune\"), fue publicada en 1965 y se convirtió en un éxito inmediato. \"Dune\" fue elogiada por su complejidad, su construcción del mundo y su exploración de temas como la ecología, la religión, la política y la filosofía. Ganó el premio Nébula de 1965 y el premio Hugo de 1966, consolidando a Herbert como un autor de ciencia ficción de renombre. Su estilo literario se caracteriza por su uso de descripciones vívidas, personajes complejos y tramas intrincadas. A menudo explora temas como la supervivencia, la identidad, el poder y la relación entre la humanidad y el medio ambiente.'),
(71, 'Margaret Atwood', 'Canadiense', 'Margaret Eleanor Atwood, conocida como Margaret Atwood, es una poeta, novelista, crítica literaria, profesora y activista política canadiense. Nació el 18 de noviembre de 1939 en Ottawa, Canadá. Pasó su infancia en el norte de Quebec y en Toronto, debido a la carrera de su padre como zoólogo. Desde temprana edad mostró interés por la lectura y la escritura. Estudió en la Universidad de Toronto, donde se graduó en inglés y filosofía. En su carrera literaria, se publicó su primer libro de poesía, \"Double Persephone\", en 1961. Ha publicado más de 50 obras, incluyendo novelas, poesía, cuentos, ensayos y libros de crítica literaria. Sigue con vida con 84 años.');
INSERT INTO `autor` (`id`, `nombre`, `nacionalidad`, `biografía`) VALUES
(72, 'Suzanne Collins', 'Estadounidense', 'Suzanne Marie Collins es una escritora y guionista estadounidense nacida el 10 de agosto de 1962 en Hartford, Connecticut. Es conocida por su trilogía de novelas juveniles \"Los juegos del hambre\", que se convirtió en un fenómeno mundial y fue adaptada a una exitosa serie de películas. Creció en una familia de clase media en Connecticut y desde temprana edad mostró interés por la escritura y la actuación. Estudió Arte, Teatro y Comunicación en la Universidad de Indiana y luego completó una maestría en Escritura Dramática en la Universidad de Nueva York. Tras graduarse, trabajó como guionista de televisión en programas infantiles para canales como Nickelodeon, donde conoció al escritor James Plumiew, quien la inspiró a escribir libros infantiles por su cuenta. En su carrera literaria, en 2003, publicó su primera novela infantil, \"Gregor: Las Tierras Bajas\", que narra la historia de un niño que debe salvar a su familia de criaturas subterráneas. La novela recibió críticas positivas y marcó el inicio de su carrera como autora de libros para jóvenes. En 2008, publicó la primera novela de la trilogía \"Los juegos del hambre\", que se convirtió en un éxito inmediato. El estilo literario de Suzanne Collins se caracteriza por su ritmo trepidante, sus personajes complejos y sus tramas llenas de acción y suspense. A menudo explora temas como la supervivencia, la rebelión, la justicia social y la lucha contra la opresión. (Actualmente con vida con 61 años)'),
(73, 'Andy Weir', 'Estadounidense', 'Andy Weir es un escritor e ingeniero informático estadounidense nacido el 16 de junio de 1972 en Davis, California. Es conocido por su novela de ciencia ficción \"El marciano\" (2011), que se convirtió en un éxito de ventas internacional y fue adaptada a una película aclamada por la crítica protagonizada por Matt Damon en 2015. Creció en California y desde temprana edad mostró interés por la ciencia, la tecnología y la escritura. Estudió Informática en la Universidad de California en San Diego, pero no completó su carrera. Tras graduarse, trabajó como programador para varias empresas de software, incluyendo AOL y Blizzard Entertainment, donde colaboró en el videojuego Warcraft 2. A inicios de su carrera literaria, comenzó a escribir historias de ciencia ficción como aficionado y las publicó en su sitio web personal. En 2011, autopublicó su primera novela, \"El marciano\", la historia de un astronauta estadounidense que se queda varado en Marte y debe usar su ingenio y conocimientos científicos para sobrevivir. El estilo literario de Andy Weir se caracteriza por su realismo científico, su humor y su capacidad para crear personajes entrañables. A menudo explora temas como la supervivencia, la exploración espacial y la importancia de la ciencia y la tecnología. (Actualmente con vida con 51 años)'),
(74, 'Eckhart Tolle', 'Alemán', 'Eckhart Tolle es un escritor y guía espiritual alemán nacido el 16 de febrero de 1948 en Lünen, Renania del Norte-Westfalia, conocido por sus enseñanzas sobre el poder del presente y la transformación personal. Nació en Alemania y a los 13 años se mudó a España con su padre. A los 19 años se trasladó a Inglaterra, donde estudió literatura y lenguas románicas en la Universidad de Londres. Llegado sus 29 años experimentó una profunda transformación espiritual que marcó el rumbo de su vida. Tras su transformación, Tolle dedicó los siguientes años a comprender, integrar y profundizar en la experiencia que había vivido. En 1997 publicó su primer libro, \"El poder del Ahora\", que se convirtió en un bestseller internacional y lo catapultó a la fama como guía espiritual. (Actualmente con vida con 76 años)'),
(75, 'Don Miguel Ruiz', 'Mexicana', 'Don Miguel Ruiz es un autor y orador mexicano nacido como Miguel Ángel Ruiz Macías el 27 de agosto de 1952 en Tijuana, México. Es conocido por'),
(76, 'Larousse', 'Francesa', 'Pierre Larousse (1817-1875) fue un pedagogo, lexicógrafo y editor francés, conocido por ser el fundador de la editorial Larousse y por su obra maestra, el Gran Diccionario Universal del Siglo XIX. Nació el 23 de octubre de 1817 en Toucy, Francia, en el seno de una familia humilde. Tras graduarse, trabajó como maestro en varias escuelas de Francia, incluyendo su ciudad natal. En 1852, se mudó a París para dedicarse a la escritura y la edición. Llegado el año 856, junto a su socio Louis-Marie Quicherat, fundó la Librairie Larousse, una editorial dedicada a la publicación de libros educativos y de referencia. La primera publicación de Larousse fue un diccionario de francés en dos volúmenes, que tuvo un gran éxito y lo consolidó como un lexicógrafo de renombre. En 1866, comenzó a trabajar en su obra maestra, el Gran Diccionario Universal del Siglo XIX, un diccionario enciclopédico de gran tamaño que incluía información sobre una amplia gama de temas, desde historia y geografía hasta ciencia y literatura. El Gran Diccionario Universal del Siglo XIX se publicó en 17 volúmenes entre 1866 y 1876 y se convirtió en una obra de referencia fundamental en Francia y en todo el mundo. Además del diccionario, Larousse también publicó otras obras importantes, como un curso de lengua francesa, una enciclopedia de la historia universal y un atlas del mundo. Pierre Larousse falleció el 3 de enero de 1875 en París, a los 57 años de edad.'),
(77, 'Chad Orzel', 'Estadounidense', 'Chad Orzel es un físico, profesor y escritor estadounidense nacido el 21 de diciembre de 1970 en Binghamton, Nueva York. Es conocido por sus libros de divulgación científica que utilizan el humor y la cultura popular para explicar conceptos científicos complejos, y por su blog \"Un científico escribe\", donde comparte sus reflexiones sobre la ciencia, la educación y la vida cotidiana. Creció en el estado de Nueva York y desde pequeño mostró interés por la ciencia y la escritura. Estudió física en el Williams College y luego se doctoró en física y química en la Universidad de Maryland. Durante su doctorado, realizó investigaciones sobre condensados de Bose-Einstein, un estado de la materia en el que los átomos se comportan como una sola onda. En su carrera como escritor y profesor, trabajó como investigador postdoctoral en la Universidad de Yale. En 2001, se unió al Departamento de Física y Astronomía del Union College, donde actualmente es profesor titular. En 2005, publicó su primer libro, \"Cómo enseñar física cuántica a su perro\", una guía divertida y accesible para la física cuántica que se convirtió en un bestseller internacional. Desde entonces, ha publicado otros libros de divulgación científica, incluyendo \"Cómo enseñar relatividad a su perro\", \"Aventuras en la física cuántica\" y \"¿Por qué los pájaros vuelan hacia el sur?\". Sus libros han sido elogiados por su humor, claridad y capacidad para conectar con lectores de todas las edades.'),
(78, 'Yuval Noah Harari', 'Israelí', 'Yuval Noah Harari (Kiryat Atta, Israel, 24 de febrero de 1976) es un historiador, filósofo y escritor israelí conocido por sus libros de divulgación histórica que exploran el futuro de la humanidad desde una perspectiva amplia y multidisciplinaria. Nació en una familia laica de ascendencia sefardí originaria de Europa del Este. Creció en Haifa, la tercera ciudad más importante de Israel, durante un período de profundos cambios sociales y políticos en el país. Desde temprana edad mostró interés por la historia, la filosofía y la lectura. Tras completar su servicio militar obligatorio, continuó sus estudios de posgrado en la Universidad de Oxford, donde obtuvo un doctorado en Historia Medieval en 2002. Su tesis doctoral, titulada \"Armas, armaduras y caballos en la guerra medieval: 1100-1500\", fue publicada como libro en 2007 y recibió elogios por su rigor académico y su originalidad. A partir del 2005, comenzó a trabajar como profesor en el Departamento de Historia del Mundo en la Universidad Hebrea de Jerusalén, donde actualmente es profesor titular. En 2011, publicó su primer libro para el público general, \"Sapiens: De animales a dioses. Una breve historia de la humanidad\", que se convirtió en un bestseller internacional y lo catapultó a la fama como escritor e intelectual público. Tras el éxito de \"Sapiens\", Harari publicó otros dos libros de gran éxito: \"Homo Deus: Breve historia del mañana\" (2016) y \"21 lecciones para el siglo XXI\" (2018).'),
(79, 'George R.R. Martin', 'Estadounidense', 'George Raymond Richard Martin (Bayonne, Nueva Jersey, 20 de septiembre de 1948), conocido como George R.R. Martin y por sus seguidores como GRRM, es un escritor estadounidense de literatura fantástica, ciencia ficción y terror. Es reconocido mundialmente por su serie de novelas de fantasía épica \"Canción de hielo y fuego\", adaptada a la exitosa serie de televisión \"Juego de tronos\". Nació en Bayonne, Nueva Jersey, en el seno de una familia obrera. Desde pequeño mostró un gran interés por la lectura y la escritura, especialmente en el género de la fantasía y la ciencia ficción. Durante su adolescencia, comenzó a escribir sus propios relatos y a participar en fanzines de ciencia ficción. Estudió periodismo en la Universidad Northwestern, donde se graduó en 1971. Tras graduarse, trabajó como profesor de inglés y guionista de televisión durante varios años. En 1977, publicó su primera novela, \"Muerte de la luz\", una obra de ciencia ficción que le valió reconocimiento en la comunidad de fans del género. Durante la década de 1980, continuó escribiendo novelas y relatos de ciencia ficción y terror, incluyendo series como \"Los viajes de Tuf\" y \"Wild Cards\". En 1991, comenzó a trabajar en su proyecto más ambicioso: la serie de novelas de fantasía épica \"Canción de hielo y fuego\". La primera novela de la serie, \"Juego de tronos\", se publicó en 1996 y se convirtió en un éxito inmediato, cautivando a los lectores con su compleja trama, personajes memorables y un mundo de fantasía rico y detallado.'),
(80, 'Haruki Murakami', 'Japonesa', 'Haruki Murakami (村上 春樹, Murakami Haruki, Kioto, 12 de enero de 1949) es un novelista, ensayista y traductor japonés reconocido mundialmente por sus obras de ficción que combinan elementos de realismo mágico, surrealismo y filosofía. Nació en Kioto, Japón, en el seno de una familia de clase media. Su padre era profesor de literatura japonesa y su madre era ama de casa. Desde temprana edad mostró interés por la literatura, tanto japonesa como occidental. En 1968, ingresó en la Universidad de Waseda en Tokio, donde estudió literatura griega y teatro. Durante sus años universitarios, comenzó a escribir sus primeros relatos y a leer obras de autores estadounidenses como Franz Kafka, Richard Brautigan y Raymond Carver, quienes lo influenciaron profundamente. En 1979, publicó su primera novela,Escucha la canción del viento, que recibió el premio literario Gunzo y lo lanzó al mundo literario japonés. En la década de 1980, consolidó su carrera como escritor con obras como 1Q84, Tokio Blues (Norwegian Wood en inglés), Kafka en la orilla y Crónica del pájaro que da cuerda al mundo. Sus novelas se caracterizan por su estilo narrativo único, que combina elementos de realismo mágico con reflexiones filosóficas y una atmósfera onírica. (Actualmente con vida con 75 años).'),
(85, 'James Stewart', 'Canadiense', 'James Stewart, el autor del libro “Cálculo de una variable”, era canadiense. Nació en Toronto, Canadá, el 29 de marzo de 1941, y también falleció en la misma ciudad el 3 de diciembre de 2014. Stewart fue un matemático destacado, violinista y profesor emérito de matemáticas de la Universidad McMaster. Recibió su maestría en ciencias en la Universidad de Stanford y su doctorado de la Universidad de Toronto en 1967. Además de su contribución académica, Stewart es conocido por su serie de libros de texto sobre cálculo, que son ampliamente utilizados en la educación matemática.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `biblioteca`
--

CREATE TABLE `biblioteca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `eslogan` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `horario` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `reputación` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `biblioteca`
--

INSERT INTO `biblioteca` (`id`, `nombre`, `eslogan`, `telefono`, `horario`, `direccion`, `reputación`) VALUES
(1, 'biblioteca el universo del libro', 'leer te lleva a lugares increibles', '0212-0564512', 'De lunes a viernes 9:30 am a 5pm', 'Chacao, Caracas', 'cinco estrellas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `autor` enum('Albert Camus','Charles Dickens','Miguel de Cervantes','Oscar Wilde','Gabriel García Márquez','Antoine de Sant-Exupéry','Ana Frank','Dante Alighieri','Edgar Allan Poe','Agatha Christie','Paulo Coelho','Kent Follett','J.K. Rowling','J.R.R. Tolkien','Ernest Hemingway','Víctor Hugo','William Shakespear','Homero','Stephen King','Bram Stoker','Max Brooks','Aurelio Baldor','Jaime Lopera y Marta Bernal','Stephen Covey','James Clear','Robin S. Sharma','Erich Fromm','Sunt Tzu','Frank Kafka','Virginia Woolf','Paula Hawkins','Gillian Flynn','Dennis Lehane','Herman Melville','Robert Luis Stevenson','Fernando Savater','Marco Aurelio','Platón','James Stewart','Isabel Allende','Laura Esquivel','Jorge de Montemayor','Gaspar Gil Polo','Jacopo Sannazaro','Jack Kerouac','John Steinbeck','Elizabeth Gilbert','Apsley Cherry-Garrard','Immanuel Karnt','Friedrich Nietzsche','René Descartes','Shirley Jackson','Marcel Mauss','Charles Perrault','Jaciob Grimm','Hans Christian Andersen','Gabrielle de Villenueve','Daniel Defoe','Jonathan Swift','Julio Verne','Mark Twain','Horacle Walpole','Mattew Gregory Lewis','Mary Shelley','Daphne Du Maurier','Frank Herbert','Margaret Atwood','Suzanne Collins','Andy Weir','Eckhart Tolle','Don Miguel Ruíz','Larousse','Chad Orzel','Yuval Noah Harari','George R.R. Martin','Haruki Murakami','Jane Austen','Antón Chejov','John Mcmurry') DEFAULT NULL,
  `genero` enum('Novela de Ficción','Novela Filosófica','Cuento corto','Novela de Aventuras','Novela pastoril','Cuento de hadas','Realismo mágico','Novela','Ensayo filosófico','Literatura de viajes','Diario','Poesía','Cuento de horror','Novela de misterio','Novela histórica','Fantasía','Novela gótica','Tragedia','Ficción sobrenatural','Ciencia ficción','Texto educativo','Autoayuda','Desarrollo personal','Filosofía','Novela corta','Suspenso','Cuento filosófico') DEFAULT NULL,
  `costo` enum('8 Bs','10 Bs','12 Bs') DEFAULT NULL,
  `año_lanzamiento` decimal(4,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id`, `titulo`, `autor`, `genero`, `costo`, `año_lanzamiento`) VALUES
(1, 'Sentido y sensibilidad', 'Jane Austen', 'Novela de Ficción', '10 Bs', 1811),
(2, 'Persuasión', 'Jane Austen', 'Novela de Ficción', '10 Bs', 1818),
(3, 'El extranjero', 'Albert Camus', 'Novela Filosófica', '10 Bs', 1942),
(4, 'El mito de sísifo', 'Albert Camus', 'Ensayo filosófico', '10 Bs', 1942),
(5, 'La peste', 'Albert Camus', 'Novela Filosófica', '10 Bs', 1947),
(6, 'Grandes esperanzas', 'Charles Dickens', 'Novela de Ficción', '10 Bs', 1861),
(7, 'Oliver Twist', 'Charles Dickens', 'Novela de Ficción', '10 Bs', 1838),
(8, 'Tiempos dificiles', 'Charles Dickens', 'Novela de Ficción', '10 Bs', 1854),
(9, 'Cuento de navidad', 'Charles Dickens', 'Cuento corto', '10 Bs', 1843),
(10, 'Don quijote de la mancha', 'Miguel de Cervantes', 'Novela de Aventuras', '10 Bs', 1605),
(11, 'La Galatea', 'Miguel de Cervantes', 'Novela pastoril', '10 Bs', 1585),
(12, 'La gitanilla', 'Miguel de Cervantes', 'Novela corta', '10 Bs', 1613),
(13, 'El retrato de Dorian Gray', 'Oscar Wilde', 'Novela Filosófica', '10 Bs', 1890),
(14, 'El príncipe feliz', 'Oscar Wilde', 'Cuento de hadas', '10 Bs', 1888),
(15, 'Cien años de soledad', 'Gabriel García Márquez', 'Realismo mágico', '10 Bs', 1967),
(16, 'Crónica de una muerte anunciada', 'Gabriel García Márquez', 'Novela', '10 Bs', 1981),
(17, 'El amor en los tiempos del cólera ', 'Gabriel García Márquez', 'Novela', '10 Bs', 1985),
(18, 'El principito', 'Antoine de Sant-Exupéry', 'Cuento filosófico', '10 Bs', 1943),
(19, 'Orgullo y prejuicio', 'Jane Austen', 'Novela de Ficción', '10 Bs', 1813),
(20, 'Tierra de hombres', 'Antoine de Sant-Exupéry', 'Literatura de viajes', '10 Bs', 1939),
(21, 'Vuelo nocturno', 'Antoine de Sant-Exupéry', 'Novela', '10 Bs', 1931),
(23, 'Divina comedia', 'Dante Alighieri', 'Poesía', '8 Bs', 1314),
(24, 'El cuervo', 'Edgar Allan Poe', 'Poesía', '10 Bs', 1845),
(25, 'La caída de la casa Usher', 'Edgar Allan Poe', 'Cuento de horror', '10 Bs', 1839),
(26, 'El corazón delator ', 'Edgar Allan Poe', 'Cuento de horror', '10 Bs', 1843),
(27, 'Asesinato en el Orient Express', 'Agatha Christie', 'Novela de misterio', '10 Bs', 1934),
(28, 'Muerte en el nilo', 'Agatha Christie', 'Novela de misterio', '10 Bs', 1937),
(29, 'El asesinato de Roger Ackroyd', 'Agatha Christie', 'Novela de misterio', '10 Bs', 1926),
(30, 'El alquimista', 'Paulo Coelho', 'Novela', '10 Bs', 1988),
(31, 'Once minutos', 'Paulo Coelho', 'Novela', '10 Bs', 2003),
(32, 'El peregrino', 'Paulo Coelho', 'Novela', '10 Bs', 1987),
(33, 'Los pilares de la tierra', 'Kent Follett', 'Novela histórica', '12 Bs', 1989),
(34, 'La caída de los gigantes', 'Kent Follett', 'Novela histórica', '10 Bs', 2010),
(35, 'La armadura de la luz', 'Kent Follett', 'Novela histórica', '12 Bs', 2023),
(36, 'Harry Potter y la piedra filosofal', 'J.K. Rowling', 'Fantasía', '12 Bs', 1997),
(37, 'Harry Potter y la cámara secreta', 'J.K. Rowling', 'Fantasía', '12 Bs', 1998),
(38, 'Harry Potter y el prisionero de Azkaban', 'J.K. Rowling', 'Fantasía', '12 Bs', 1999),
(39, 'Harry Potter y el cáliz de fuego', 'J.K. Rowling', 'Fantasía', '12 Bs', 2000),
(40, 'Harry Potter y la orden del fénix', 'J.K. Rowling', 'Fantasía', '12 Bs', 2003),
(41, 'El hobbit', 'J.R.R. Tolkien', 'Fantasía', '12 Bs', 1937),
(42, 'La comunidad del anillo', 'J.R.R. Tolkien', 'Fantasía', '12 Bs', 1954),
(43, 'Las dos torres', 'J.R.R. Tolkien', 'Fantasía', '12 Bs', 1954),
(44, 'El retorno del rey', 'J.R.R. Tolkien', 'Fantasía', '12 Bs', 1955),
(45, 'El viejo y el mar', 'Ernest Hemingway', 'Novela', '10 Bs', 1952),
(46, 'Por quién doblan las campanas', 'Ernest Hemingway', 'Novela', '10 Bs', 1940),
(47, 'Adiós a las armas', 'Ernest Hemingway', 'Novela', '10 Bs', 1929),
(48, 'Los miserables', 'Víctor Hugo', 'Novela histórica', '10 Bs', 1862),
(49, 'Nuestra señora de parís', 'Víctor Hugo', 'Novela gótica', '10 Bs', 1831),
(50, 'Hamlet', 'William Shakespear', 'Tragedia', '10 Bs', 1623),
(51, 'Romeo y Julieta', 'William Shakespear', 'Tragedia', '10 Bs', 1597),
(52, 'Julio César', 'William Shakespear', 'Tragedia', '10 Bs', 1599),
(53, 'El jardín de los cerezos', 'Antón Chejov', 'Cuento filosófico', '8 Bs', 1904),
(54, 'Química orgánica', 'John Mcmurry', 'Texto educativo', '8 Bs', 2024),
(55, 'It', 'Stephen King', 'Ficción sobrenatural', '10 Bs', 1986),
(56, 'El resplandor', 'Stephen King', 'Ficción sobrenatural', '10 Bs', 1977),
(57, 'Carrie', 'Stephen King', 'Ficción sobrenatural', '10 Bs', 1974),
(58, 'Drácula', 'Bram Stoker', 'Novela gótica', '10 Bs', 1897),
(59, 'La casa del juez', 'Bram Stoker', 'Cuento de horror', '10 Bs', 1891),
(60, 'Guerra mundial Z', 'Max Brooks', 'Ciencia ficción', '8 Bs', 2006),
(61, 'Álgebra', 'Aurelio Baldor', 'Texto educativo', '8 Bs', 1941),
(62, 'La culpa es de la vaca', 'Jaime Lopera y Marta Bernal', 'Autoayuda', '12 Bs', 2015),
(63, 'La culpa es de la vaca 2', 'Jaime Lopera y Marta Bernal', 'Autoayuda', '12 Bs', 2015),
(64, 'Los siete hábitos de la gente altamente efectiva', 'Stephen Covey', 'Desarrollo personal', '8 Bs', 1989),
(65, 'Hábitos atómicos', 'James Clear', 'Desarrollo personal', '8 Bs', 2018),
(66, 'El monje que vendió su Ferrari', 'Robin S. Sharma', 'Desarrollo personal', '8 Bs', 1996),
(67, 'El arte de amar', 'Erich Fromm', 'Desarrollo personal', '8 Bs', 1956),
(68, 'Diarios', 'Frank Kafka', 'Diario', '10 Bs', 1948),
(69, 'La metamorfosis', 'Frank Kafka', 'Novela corta', '10 Bs', 1915),
(70, 'Diario de Virginia Woolf', 'Virginia Woolf', 'Diario', '8 Bs', 1915),
(71, 'La chica del tren', 'Paula Hawkins', 'Suspenso', '8 Bs', 2015),
(72, 'Perdida', 'Gillian Flynn', 'Suspenso', '8 Bs', 2012),
(73, 'La isla siniestra', 'Dennis Lehane', 'Suspenso', '8 Bs', 2003),
(74, 'Moby Dick', 'Herman Melville', 'Novela', '8 Bs', 1851),
(75, 'El extraño caso del Dr. Jekyll y Mr. Hyde', 'Robert Luis Stevenson', 'Novela corta', '10 Bs', 1886),
(76, 'La isla del tesoro', 'Robert Luis Stevenson', 'Novela de Aventuras', '10 Bs', 1883),
(77, 'Las preguntas de la vida', 'Fernando Savater', 'Filosofía', '8 Bs', 1999),
(78, 'Meditaciones', 'Marco Aurelio', 'Filosofía', '8 Bs', 1559),
(79, 'Calculo de una variable', 'James Stewart', 'Texto educativo', '8 Bs', 2008),
(80, 'La casa de los espíritus', 'Isabel Allende', 'Realismo mágico', '8 Bs', 1982),
(81, 'Como agua para chocolate', 'Laura Esquivel', 'Realismo mágico', '8 Bs', 1989),
(82, 'Los siete libros de la Diana', 'Jorge de Montemayor', 'Novela pastoril', '8 Bs', 1559),
(83, 'Diana enamorada', 'Gaspar Gil Polo', 'Novela pastoril', '8 Bs', 1564),
(84, 'Arcadia', 'Jacopo Sannazaro', 'Novela pastoril', '8 Bs', 1504),
(85, 'En el camino', 'Jack Kerouac', 'Literatura de viajes', '8 Bs', 1957),
(86, 'Viajes con Charlie', 'John Steinbeck', 'Literatura de viajes', '8 Bs', 1962),
(87, 'Comer, rezar, amar', 'Elizabeth Gilbert', 'Literatura de viajes', '8 Bs', 2006),
(88, 'El peor viaje del mundo', 'Apsley Cherry-Garrard', 'Literatura de viajes', '8 Bs', 1922),
(89, 'Critica de la razón pura', 'Immanuel Karnt', 'Ensayo filosófico', '8 Bs', 1781),
(90, 'Así habló Zaratustra', 'Friedrich Nietzsche', 'Ensayo filosófico', '8 Bs', 1883),
(91, 'Discurso sobre el método  ', 'René Descartes', 'Ensayo filosófico', '8 Bs', 1637),
(92, 'La lotería', 'Shirley Jackson', 'Cuento filosófico', '10 Bs', 1948),
(93, 'La maldición de Hill House', 'Shirley Jackson', 'Novela gótica', '10 Bs', 1959),
(94, 'La ética del don', 'Marcel Mauss', 'Cuento filosófico', '8 Bs', 1925),
(95, 'Cenicienta', 'Charles Perrault', 'Cuento de hadas', '8 Bs', 1697),
(96, 'Blancanieves y los siete enaninos', 'Jaciob Grimm', 'Cuento de hadas', '8 Bs', 1812),
(97, 'La sirenita', 'Hans Christian Andersen', 'Cuento de hadas', '8 Bs', 1837),
(98, 'La bella y la bestia', 'Gabrielle de Villenueve', 'Cuento de hadas', '8 Bs', 1740),
(99, 'Robinson Crusoe', 'Daniel Defoe', 'Novela de Aventuras', '8 Bs', 1719),
(100, 'Los viajes de Gulliver', 'Jonathan Swift', 'Novela de Aventuras', '8 Bs', 1726),
(101, 'Veinte mil leguas de viaje submarino', 'Julio Verne', 'Novela de Aventuras', '8 Bs', 1870),
(102, 'Las aventuras de Tom Sawyer', 'Mark Twain', 'Novela de Aventuras', '8 Bs', 1876),
(103, 'El castillo de Otranto', 'Horacle Walpole', 'Novela gótica', '8 Bs', 1764),
(104, 'El monje', 'Mattew Gregory Lewis', 'Novela gótica', '8 Bs', 1796),
(105, 'Frankenstein', 'Mary Shelley', 'Novela gótica', '8 Bs', 1818),
(106, 'Rebecca', 'Daphne Du Maurier', 'Novela gótica', '8 Bs', 1938),
(107, 'Dune', 'Frank Herbert', 'Ciencia ficción', '8 Bs', 1965),
(108, 'El cuento de la criada', 'Margaret Atwood', 'Ciencia ficción', '8 Bs', 1985),
(109, 'Los juegos del hambre', 'Suzanne Collins', 'Ciencia ficción', '12 Bs', 2008),
(110, 'Los juegos del hambre - en llamas', 'Suzanne Collins', 'Ciencia ficción', '12 Bs', 2009),
(111, 'Los juegos del hambre - Sinsajo', 'Suzanne Collins', 'Ciencia ficción', '12 Bs', 2010),
(112, 'Los juegos del hambre - balada pajaros cantores y serpiertes', 'Suzanne Collins', 'Ciencia ficción', '12 Bs', 2020),
(113, 'El marciano', 'Andy Weir', 'Ciencia ficción', '8 Bs', 2011),
(114, 'El poder del ahora', 'Eckhart Tolle', 'Autoayuda', '8 Bs', 1977),
(115, 'Los cuatro acuerdos', 'Don Miguel Ruíz', 'Autoayuda', '8 Bs', 1997),
(116, 'Diccionario básico lengua española', 'Larousse', 'Texto educativo', '10 Bs', 2011),
(117, 'Diccionario español-francés/francés-español ', 'Larousse', 'Texto educativo', '10 Bs', 2007),
(118, 'Diccionario español-ingles', 'Larousse', 'Texto educativo', '10 Bs', 2002),
(119, 'Como enseñar física cuántica a tu perro', 'Chad Orzel', 'Texto educativo', '8 Bs', 2009),
(120, 'Sapiens', 'Yuval Noah Harari', 'Texto educativo', '8 Bs', 2011),
(121, 'Juego de tronos', 'George R.R. Martin', 'Fantasía', '10 Bs', 1996),
(122, 'Choque de reyes', 'George R.R. Martin', 'Fantasía', '10 Bs', 1998),
(123, 'Tormenta de espadas', 'George R.R. Martin', 'Fantasía', '10 Bs', 2000),
(124, 'Hombres sin mujeres', 'Haruki Murakami', 'Novela corta', '8 Bs', 2014),
(125, 'El banquete', 'Platón', 'Filosofía', '10 Bs', 1872),
(126, 'La república ', 'Platón', 'Filosofía', '10 Bs', 1872),
(127, 'La Ilíáda', 'Homero', 'Poesía', '10 Bs', 1990),
(128, 'Odisea', 'Homero', 'Poesía', '10 Bs', 1935),
(135, 'Orgullo y prejuicio', 'Jane Austen', 'Novela de Ficción', '8 Bs', 1813);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro_biblioteca`
--

CREATE TABLE `libro_biblioteca` (
  `id_libro` int(11) NOT NULL,
  `id_biblioteca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro_biblioteca`
--

INSERT INTO `libro_biblioteca` (`id_libro`, `id_biblioteca`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `nombre`, `apellido`, `direccion`, `usuario`, `contrasena`) VALUES
(74, 'jose', 'palma', 'los teques', 'jose15', '$2y$10$2tKYIMlGAwPUE4XysQrxTO.HGgXMtVn1ZvU/2QnJKkADZiS/JtGO.');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_alquiler_usuario` (`user_id`);

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `biblioteca`
--
ALTER TABLE `biblioteca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_Titulo` (`titulo`),
  ADD KEY `idx_Autor` (`autor`);

--
-- Indices de la tabla `libro_biblioteca`
--
ALTER TABLE `libro_biblioteca`
  ADD PRIMARY KEY (`id_libro`,`id_biblioteca`),
  ADD KEY `id_biblioteca` (`id_biblioteca`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400;

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `biblioteca`
--
ALTER TABLE `biblioteca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `fk_alquiler_usuario` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `libro_biblioteca`
--
ALTER TABLE `libro_biblioteca`
  ADD CONSTRAINT `libro_biblioteca_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libro` (`id`),
  ADD CONSTRAINT `libro_biblioteca_ibfk_2` FOREIGN KEY (`id_biblioteca`) REFERENCES `biblioteca` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
