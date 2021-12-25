
import SwiftUI
struct ContentView: View {
    @State var animasyonAktif: Bool = false
    @State var begeniSayisi: Int = 0
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Image("profil")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 70, height: 70)

                    
                    VStack(alignment: .leading){
                        Text("Ömer Şanlı")
                            .font(.system(size: 20))
                            .bold()
                        Text("omersanli17")
                            .font(.system(size: 15))
                    }
 
                    Spacer()
                }
                
                ZStack{
                    Image("doga")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .scaledToFit()
                        .frame(width: 340)
                        .onTapGesture(count: 2) {
                            if animasyonAktif == false {
                                withAnimation {
                                    animasyonAktif = true
                                    begeniSayisi = begeniSayisi + 1
                                    
                                }
            
                                
                            }else{
                                withAnimation {
                                    animasyonAktif = false
                                    begeniSayisi = begeniSayisi - 1
                                }
                        
                            }
                        }
                    
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(animasyonAktif ? .red : .white)
                        .font(.system(size: 70))
                        .animation(.easeIn(duration: 0.5), value: animasyonAktif)
                        .opacity(animasyonAktif ? 1 : 0)
                }
                
                HStack{
                    
                    Image(systemName: animasyonAktif ? "heart.fill" : "heart")
                        .foregroundColor(animasyonAktif ? .red : .black)
                        .font(.system(size: 20))
                        .padding(.horizontal, 5)
                        .padding(.vertical, 5)
                    
                    Text("Beğeni Sayısı: \(begeniSayisi) ")
                    Spacer()
                    
                }
                Spacer()
     
            }// MARK: VSTACK SONU
            .padding(.vertical, 5)
            .padding(.horizontal, 20)
            .navigationTitle("Instagram")
            .navigationBarTitleDisplayMode(.inline)
            
        }// MARK: Nav View Sonu
        .navigationViewStyle(.stack)
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
