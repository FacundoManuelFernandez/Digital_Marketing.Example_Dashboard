En SQL realizamos un proceso de creación de una base de datos e inserción de registros desde cero.

En primer lugar, se procedió a la normalización de la tabla original. Este proceso se realizó como mero ejercicio, ya que en términos prácticos no afecta significativamente la eficiencia ni el desempeño de una base de datos de este tamaño.

La tabla original consta de los siguientes campos:
- id : identificación unívoca del desempeño de cada campaña por día. En total hay 11 IDs por fecha, uno por cada campaña
- c_date : Fecha correspondiente a los datos
- campaign_name : Nombre de la campaña
- category : Categoría de la campaña (Search, Social, Influencer, Media)
- campaign_id : ID de la campaña
- impressions : Impresiones
- mark_spent : Inversión en Marketing
- clicks : Clics sobre el anuncio. Cada clic lleva al sitio web
- leads : Registros dentro del sitio web (suscripciones)
- orders : Ventas
- revenue : Ingresos

Además, agregamos el campo 'Medio' (Instagram, YouTube, Facebook, Google, Banner) para obtener un desglose más detallado.

En línea con el proceso de normalización, se asignaron IDs únicos a los siguientes campos con el objetivo de optimizar el almacenamiento:
- campaign_name (Campaña)
- category (Categoría)
- Medio

El resto de los campos no se normaliza, ya que corresponden a valores directos, a saber:
- IDs (id y campaign_id),
- Fechas (c_date)
- Métricas (impresiones, clics, suscripciones, ventas, inversión en marketing, ingresos).

Esto resultó en la creación de tres nuevas entidades:

Campaña
- ID_Campaña (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11) - PK
- Nombre Campaña (facebook_tier1, facebook_tier2, google_hot, google_wide, youtube_blogger, instagram_tier1, instagram_tier2, facebook_retargeting, facebook_lal, instagram_blogger, banner_partner)

Categoría
- ID_Categoría (1, 2, 3, 4) - PK
- Categoría (Social, Search, Influencer, Media)

Medio
- ID_Medio (1, 2, 3, 4, 5) - PK
- Medio (YouTube, Instagram, Google, Facebook, Banner)

Y finalmente una 'Tabla de Hechos' con los siguientes campos:
- id
- c_date
- ID_Campaña (FK)
- ID_Categoría (FK)
- ID_Medio (FK)
- campaign_id
- Impresiones
- Inversión en Marketing
- Clics
- Suscripciones
- Ventas
- Ingresos

Las relaciones entre tablas quedan establecidas de la siguiente manera:
- ID_Campaña (PK) en Campaña se relaciona con ID_Campaña (FK) en Tabla De Hechos - Relación: Uno a Muchos (1 a *)
- ID_Categoría (PK) en Categoría se relaciona con ID_Categoría (FK) en Tabla De Hechos - Relación: Uno a Muchos (1 a *)
- ID_Medio (PK) en Medio se relaciona con ID_Medio (FK) en Tabla De Hechos - Relación: Uno a Muchos (1 a *)

Una vez definido el esquema de la base de datos, se procedió a su creación utilizando Transact-SQL y a la inserción de registros desde archivos CSV. Se utilizaron 4 archivos (uno para cada tabla).

Dentro de la carpeta 'CSV' pueden encontrar las fuentes de datos utilizadas y en 'Queries' los scripts para la creación de la base y la carga de los datos.
