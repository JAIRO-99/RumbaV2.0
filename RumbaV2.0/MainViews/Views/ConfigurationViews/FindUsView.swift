import SwiftUI

struct FindUsView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        NavigationView {
            ZStack {
                Color("negro")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Encuentranos")
                        .font(.custom("Poppins-SemiBold", size: 25))
                        .foregroundColor(.white)
                    VStack(alignment: .leading){
                        SocialView(image: "ig", text: "Página de Instagram", url: "https://www.instagram.com/rumbalatam/")
                        SocialView(image: "tiktok", text: "Página de Tiktok", url: "https://www.tiktok.com/@rumba.latam?_t=8pCKn98KogI&_r=1")
                    }
                    .padding()
                    Spacer()
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                    .padding()
                }
            }
        }
    }
}

struct SocialView: View {
    var image: String
    var text: String
    var url: String
    
    var body: some View {
        Link(destination: URL(string: url)!) {
            HStack{
                Image(image)
                    .resizable()
                    .frame(width: 30,height: 30)
                
                Text(text)
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .foregroundColor(.white)
                    .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    FindUsView()
}
