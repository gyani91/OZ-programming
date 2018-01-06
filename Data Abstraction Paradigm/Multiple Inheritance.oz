declare
class figure
   meth draw end
end

class Line from Figure
   meth draw end
end

class LinkedList
   meth forall(M)
      %invoke M on all the elements
   end
end

class CompoundFigure from Figure LinkedList
   meth draw
      {self forall(draw)}
   end
end