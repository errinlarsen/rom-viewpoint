module ROM
  module Viewpoint
    module SetupForTests
      ROM.setup(:viewpoint)

      class Folders < ROM::Relation[:viewpoint]
        dataset :folders

        def by_id(id)
          get_folder(id)
        end
      end

      class Items < ROM::Relation[:viewpoint]
        dataset :items

        def by_folder_id(id)
          find_items(folder_id: id)
        end
      end

      ROM.finalize
    end
  end
end
