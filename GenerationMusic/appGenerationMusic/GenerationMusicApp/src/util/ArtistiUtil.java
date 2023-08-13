package util;

import java.util.List;

import model.Artista;
import model.Band;
import model.Locale;

public class ArtistiUtil {
    public static Artista trovaArtistaPerID(List<Artista> listaArtisti, int idArtista) {
        for (Artista artista : listaArtisti) {
            if (artista.getId() == idArtista) {
                return artista;
            }
        }
        return null; // Se l'artista non viene trovato, restituisce null
    }
    
    public static Band trovaBandPerID(List<Band> listaBand, int idBand) {
        for (Band b : listaBand) {
            if (b.getIdBand() == idBand) {
                return b;
            }
        }
        return null; // Se l'artista non viene trovato, restituisce null
    }
    
    
    public static Locale trovaLocalePerID(List<Locale> listaLocale, int idLocale) {
        for (Locale l : listaLocale) {
            if (l.getId() == idLocale) {
                return l;
            }
        }
        return null; // Se l'artista non viene trovato, restituisce null
    }
    
    
    
    
}
