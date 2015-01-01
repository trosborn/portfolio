5.times do |i|
  Post.create(title: "Post #{i.to_s + "Aminoize"}", body: "Bacon ipsum dolor sit amet pork chop shank strip steak. Tongue ham kevin shoulder kielbasa venison bacon short ribs t-bone capicola short loin. Prosciutto tenderloin meatloaf shoulder. Filet mignon strip steak bresaola, drumstick jowl pig swine short ribs tenderloin flank brisket. Sausage hamburger pork loin tongue, pancetta spare ribs bresaola ham doner ribeye shoulder tenderloin fatback. Leberkas boudin pastrami pork chop, chuck shoulder pork loin filet mignon capicola kevin beef ribs porchetta chicken. #{i}")
end
