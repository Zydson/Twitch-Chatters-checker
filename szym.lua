liczba = 0

function sprawdz(dane) -- CHECKING FOR SPECIFIED STREAMERS
if dane ~= nil then
if string.find(dane,"xayoo_") or string.find(dane,"japczan") or string.find(dane,"vysotzky") or string.find(dane,"lukisteve") or string.find(dane,"holak1337") or string.find(dane,"Ewroon") or string.find(dane,"popo") or string.find(dane,"mlodziutki7") or string.find(dane,"KlaudiaCroft") or string.find(dane,"Aki_997") or string.find(dane,"matixoxoo_") or string.find(dane,"dejvid_tibijski_zadymiarz") then
  return true
else
  return false
end
else
  return false
end
end

tabelanickizjebow = {}
liczniklogi = {}
licznikl = {}
licz = {}
ileogladane = {}
liczniklogow = {}
licznikilogow = {}

PerformHttpRequest("http://tmi.twitch.tv/group/user/franio/chatters", function (bledy, widz, head) -- WHICH STREAMER CHAT TO CHECK
  nickwidza = json.decode(widz)
  for z, x in pairs(nickwidza.chatters) do
    for a, b in pairs(x) do
      Wait(50)
      liczba = liczba + 1
      local link = "https://xayo.pl/api/mostWatched/"..tostring(b) -- API FOR CHECKING WATCHTIME (PL ONLY)
      if link ~= nil then
        PerformHttpRequest(link, function (bledy, co, head)
          kto = co
          if co ~= nil then
          if sprawdz(kto) then
            local tabelaoglodanych = json.decode(co)
            for k, v in pairs(tabelaoglodanych) do
              local streamer = v['streamer']
              local count = v['count']
              if sprawdz(streamer) then
                licz[b] = (licz[b] or 0) + 1
                if count > 500 then
                  ileogladane[b] = (ileogladane[b] or 0) + count
                  if tabelanickizjebow[b] == nil then
                      local minuty = tonumber(count * 5)
                      if minuty > 2880 then
                        PerformHttpRequest("https://zyd.com/bazazjebow.php/?Nick="..b.."&Streamer="..streamer.."&Minuty="..minuty, function (x, y, z) -- INSERT TO DATABASE (you need to change it)
                      end)
                    end
                  end
                end
              end
            end
          end
        end
        end)
    end
    end
  end
  end)
