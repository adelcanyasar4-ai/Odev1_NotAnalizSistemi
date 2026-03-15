clc;
clear;

ogrenciSayisi = input('Siniftaki ogrenci sayisini giriniz: ');

toplam = 0;
enYuksek = -1;
enDusuk = 101;
gecen = 0;
kalan = 0;
aaSayisi = 0;
ffSayisi = 0;

for i = 1:ogrenciSayisi
    
    fprintf('\n--- OGRENCI %d ---\n', i);
    
    ogrenciKodu = input('Ogrenci kodu: ');
    
    % Kisa sinav
    kisa = input('Kisa sinav notu: ');
    while (kisa < 0 || kisa > 100)
        disp('Hatali giris! Tekrar giriniz.');
        kisa = input('Kisa sinav notu: ');
    end
    
    % Ara sinav
    ara = input('Ara sinav notu: ');
    while (ara < 0 || ara > 100)
        disp('Hatali giris! Tekrar giriniz.');
        ara = input('Ara sinav notu: ');
    end
    
    % Final
    final = input('Final notu: ');
    while (final < 0 || final > 100)
        disp('Hatali giris! Tekrar giriniz.');
        final = input('Final notu: ');
    end
    
    basari = 0.20*kisa + 0.30*ara + 0.50*final;
    
    if basari >= 85
        harf = 'AA';
        aaSayisi = aaSayisi + 1;
    elseif basari >= 70
        harf = 'BB';
    elseif basari >= 60
        harf = 'CC';
    elseif basari >= 50
        harf = 'DD';
    else
        harf = 'FF';
        ffSayisi = ffSayisi + 1;
    end
    
    if basari >= 60 && final >= 50
        durum = 'GECTI';
        gecen = gecen + 1;
    else
        durum = 'KALDI';
        kalan = kalan + 1;
    end
    
    toplam = toplam + basari;
    
    if basari > enYuksek
        enYuksek = basari;
    end
    
    if basari < enDusuk
        enDusuk = basari;
    end
    
    fprintf('Basari Puani: %.2f\n', basari);
    fprintf('Harf Notu: %s\n', harf);
    fprintf('Durum: %s\n', durum);

end

ortalama = toplam / ogrenciSayisi;

fprintf('\n--- SINIF OZETI ---\n');
fprintf('Sinif Ortalamasi: %.2f\n', ortalama);
fprintf('En Yuksek Puan: %.2f\n', enYuksek);
fprintf('En Dusuk Puan: %.2f\n', enDusuk);
fprintf('Gecen Sayisi: %d\n', gecen);
fprintf('Kalan Sayisi: %d\n', kalan);
fprintf('AA Sayisi: %d\n', aaSayisi);
fprintf('FF Sayisi: %d\n', ffSayisi);
