import requests
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

# Configura tu credencial de Firebase
cred = credentials.Certificate("pianta-grande-rg-e2bb451185df.json")
firebase_admin.initialize_app(cred)

# Inicializa Firestore
db = firestore.client()

# Función para obtener información de mangas de la API de Kitsu con ratingRank < 100
def obtener_mangas_con_rating_bajo():
    url = "https://kitsu.io/api/edge/manga?page%5Blimit%5D=20&page%5Boffset%5D=40&sort=-averageRating"
    response = requests.get(url)
    data = response.json()
    return data

# Función para guardar datos en Firebase
def guardar_en_firebase(datos_manga):
    print(datos_manga)
    for manga in datos_manga['data']:
        atributos = manga['attributes']
        imagen = ''
        if 'coverImage' in atributos and atributos['posterImage'] is not None:
            imagen = atributos['posterImage'].get('large', '')
        else: 
            imagen = atributos['coverImage'].get('large', '')
        doc_ref = db.collection(u'mangas').document(atributos['canonicalTitle'])
        doc_ref.set({
            u'slug': atributos.get('slug', ''),
            u'titulo': atributos.get('canonicalTitle', ''),
            u'tituloAbreviado': atributos.get('abbreviatedTitles', ''),
            u'fechaCreacion': atributos.get('startDate', ''),
            u'fechaFinalizacion': atributos.get('endDate', ''),
            u'edadRecomendada': atributos.get('ageRating', ''),
            u'guiaParaPublico': atributos.get('ageRatingGuide', ''),
            u'subtipo': atributos.get('subtype', ''),
            u'estado': atributos.get('status', ''),
            u'descripcion': atributos.get('synopsis', ''),
            u'imagen': imagen,
            u'metaDatos': atributos.get('meta', {}),
            u'tomo': 1
        })

# Obtener mangas con ratingRank < 100
mangas = obtener_mangas_con_rating_bajo()

# Guardar datos en Firebase
guardar_en_firebase(mangas)
