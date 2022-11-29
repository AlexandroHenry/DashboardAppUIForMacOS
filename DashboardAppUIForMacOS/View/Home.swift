//
//  Home.swift
//  DashboardAppUIForMacOS
//
//  Created by Seungchul Ha on 2022/11/29.
//

import SwiftUI

struct Home: View {
    
    // Current Tab...
    @State var currentTab: String = "home"
    
    // For Matched Geometry Effect...
    @Namespace var animation
    
    @State var currentHoverID: String = ""
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            // Side Bar Menu...
            VStack(spacing: 10) {
                
                // Menu Buttons....
                ForEach(["house", "display", "bag", "creditcard", "trophy", "list.bullet.rectangle.portrait.fill"], id: \.self) { image in
                    
                    MenuButton(image: image)
                    
                }
            }
            .padding(.top, 60)
            .frame(width: 85)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(
                
                // Corner Radius only on Right side...
                ZStack {
                    
                    Color.white
                        .padding(.trailing, 30)
                    
                    Color.white
                        .cornerRadius(15)
                        .shadow(color: Color.black.opacity(0.03), radius: 5, x: 5, y: 0)
                }
                .ignoresSafeArea()
            )
            
            // Home View ...
            VStack(spacing: 15) {
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 2) {
                        
                        Text("Dashboard")
                            .font(.title.bold())
                            .foregroundColor(.black)
                        
                        Text("Payment updates")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    // Search Bar....
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .font(.title3)
                            .foregroundColor(.black)
                        
                        TextField("Search", text: .constant(""))
                            .frame(width: 150)
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(Color.white.opacity(0.99))
                    .clipShape(Capsule())
                }
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    RecentsView()
                    
                    // Graph View....
                    AnalyticsView()
                        .padding(.vertical, 20)
                    
                    HistoryView()
                }
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
        }
        // Max Frame....
        .frame(width: getRect().width / 1.75, height: getRect().height - 130, alignment: .leading)
        .background(Color.white.opacity(0.8).ignoresSafeArea())
        // Applying button style to whole view ...
        .buttonStyle(BorderlessButtonStyle())
        .textFieldStyle(PlainTextFieldStyle())
        
    }
    
    @ViewBuilder
    func MenuButton(image: String) -> some View {
        
        Image(systemName: image)
            .resizable()
            .renderingMode(.template)
            .aspectRatio(contentMode: .fit)
            .foregroundColor(currentTab == image ? .black : .gray)
            .frame(width: 22, height: 22)
            .frame(width: 80, height: 50)
            .overlay(
                
                HStack {
                    
                    if currentTab == image {
                        Capsule()
                            .fill(Color.black)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .frame(width: 2, height: 40)
                            .offset(x: 2)
                    }
                }
                ,alignment: .trailing
            )
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation(.spring()) {
                    currentTab = image
                }
            }
    }
    
    @ViewBuilder
    func RecentsView() -> some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing: 15) {
                
                ForEach(recents) { recent in
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        HStack {
                            
                            Image(systemName: recent.image)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 26, height: 26)
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Image(systemName: "ellipsis")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 16, height: 16)
                                .rotationEffect(.degrees(90))
                                .foregroundColor(.gray)
                        }
                        
                        Text(recent.title)
                            .foregroundColor(.gray)
                        
                        Text(recent.price)
                            .font(.title2.bold())
                            .foregroundColor(.black)
                    }
                    .padding()
                    .frame(width: 150)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.03), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.03), radius: 5, x: -5, y: -5)
                }
            }
            .padding(.vertical)
            .padding(.trailing)
            
        }
    }
    
    @ViewBuilder
    func AnalyticsView() -> some View {
        
        VStack(alignment: .leading, spacing: 2) {
            
            Text("Balance")
                .font(.callout)
                .foregroundColor(.gray)
            
            Text("$1500")
                .font(.title.bold())
                .foregroundColor(.black)
            
            // Bar graph...
            BarGraph(analytics: analyticsData)
        }
    }
    
    @ViewBuilder
    func HistoryView() -> some View {
        
        VStack(alignment: .leading, spacing: 2) {
            Text("History")
                .font(.title.bold())
                .foregroundColor(.black)
            
            Text("Transaction of last 3 months")
                .font(.callout)
                .foregroundColor(.gray)
            
            VStack(spacing: 8) {
                
                ForEach(histories) { history in
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: history.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .padding(6)
                            .background(Color.black)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.03), radius: 5, x: 5, y: 5)
                        
                        Text(history.description)
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(history.time)
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(history.amount)
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Completed")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: 20)
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background(Color.white.opacity(currentHoverID == history.id ? 1 : 0 ))
                    .cornerRadius(8)
                    // Hover Animation...
                    .onHover { status in
                        withAnimation {
                            if status {
                                currentHoverID = history.id
                            } else {
                                currentHoverID = ""
                            }
                        }
                    }
                }
            }
            .padding(.vertical, 25)
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Extending View to get Screen Frame...
extension View {
    func getRect() -> CGRect {
        return NSScreen.main!.visibleFrame
    }
}
