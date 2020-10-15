function zCoord = GetChaser_EP_Z_Coord(targetPos, chaserPos)
    % Return the Z coordinate of the chaser with respect to the target
    % position in the Earth-Pointing LVLH frame
    targetRadialDir = targetPos/norm(targetPos)
    zCoord = -dot((chaserPos-targetPos),targetRadialDir)
end